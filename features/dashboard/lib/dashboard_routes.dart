import 'package:core/core.dart';
import 'package:home/chat_detail/bindings/chat_detail_binding.dart';
import 'package:home/chat_detail/views/chat_detail_view.dart';
import 'package:home/chat_list/bindings/chat_list_binding.dart';
import 'package:home/chat_list/views/chat_list_view.dart';
import 'package:home/dashboard_export.dart';
import 'package:home/profile/bindings/profile_binding.dart';
import 'package:home/profile/views/profile_view.dart';

class DashboardRoutes {
  DashboardRoutes._();

  static final routes = [
    GetPage(
        page: () => const DashboardView(),
        name: AllRoutes.dashboard,
        binding: DashboardBinding(),
        bindings: [ChatListBinding(), ProfileBinding()]),
    GetPage(
      page: () => const ChatListView(),
      name: AllRoutes.chatList,
      binding: ChatListBinding(),
    ),
    GetPage(
        page: () => const ProfileView(),
        name: AllRoutes.profile,
        binding: ProfileBinding()),
    GetPage(
        page: () => const ChatDetailView(),
        name: AllRoutes.chatDetail,
        binding: ChatDetailBinding())
  ];
}
