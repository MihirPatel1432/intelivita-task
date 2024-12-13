import 'package:core/core.dart';
import 'package:home/chat_detail/controllers/chat_detail_controller.dart';
import 'package:home/dashboard_export.dart';

class ChatDetailBinding extends Bindings {
  @override
  void dependencies() {
    DependencyProvider.registerSingleton<MainRepository>(MainRepositoryImpl(),
        permanent: true);
    DependencyProvider.registerLazySingleton<ChatDetailController>(
        () => ChatDetailController(Get.find()));
  }
}
