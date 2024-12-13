import 'package:core/core.dart';
import 'package:home/chat_list/controllers/chat_list_controller.dart';
import 'package:home/dashboard_export.dart';

class ChatListBinding extends Bindings {
  @override
  void dependencies() {
    DependencyProvider.registerSingleton<MainRepository>(MainRepositoryImpl(),
        permanent: true);
    DependencyProvider.registerLazySingleton<ChatListController>(
        () => ChatListController(Get.find()),permanent: true);
  }
}
