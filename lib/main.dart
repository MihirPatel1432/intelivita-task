import 'package:core/core.dart';
import 'package:core/global/global_binding.dart';
import 'package:core/global/global_controller.dart';
import 'package:core/theme/theme_resource.dart';
import 'package:flutter/material.dart';
import 'package:IntelivitaTask/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => ProgressService().init());
  await Get.putAsync(() => SharedPreferenceService().init());
  await Get.putAsync(() => NetworkService().init());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with GlobalController {
  @override
  void initState() {
    super.initState();
  }

  String get initialRoute =>
      sharedPreferenceService.getLoggedInStatus() ? AllRoutes.init : AllRoutes.login;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialBinding: GlobalBinding(),
        initialRoute: initialRoute,
        theme: ThemeResource().lightTheme,
        darkTheme: ThemeResource().darkTheme,
        themeMode: ThemeResource().themeMode ?? ThemeMode.system,
        getPages: AppPages.routes,
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
        builder: (context, widget) {
          return Obx(() {
            return Stack(
              children: [
                IgnorePointer(
                    ignoring: Get.find<ProgressService>().showProgress.value,
                    child: widget),
                SafeArea(
                  child: AnimatedContainer(
                      height:
                          Get.find<NetworkService>().isConnectedToInternet.value
                              ? 0
                              : 100.h,
                      duration: Utils.animationDuration,
                      color: ThemeData().primaryColor,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Center(
                            child: Text(StringConstants.noInternetConnection,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        fontSize: 40.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface))),
                      )),
                ),
                Get.find<ProgressService>().showProgress.isTrue
                    ? const Center(child: AppProgressDialog())
                    : const Offstage()
              ],
            );
          });
        },
      ),
    );
  }
}
