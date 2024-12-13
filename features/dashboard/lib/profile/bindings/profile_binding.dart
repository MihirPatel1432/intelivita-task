import 'package:core/core.dart';
import 'package:home/dashboard_export.dart';
import 'package:home/profile/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    DependencyProvider.registerSingleton<MainRepository>(MainRepositoryImpl(),
        permanent: true);
    DependencyProvider.registerLazySingleton<ProfileController>(
        () => ProfileController(Get.find()),permanent: true);
  }
}
