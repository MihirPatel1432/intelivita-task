import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/chat_list/views/chat_list_view.dart';
import 'package:home/dashboard_export.dart';
import 'package:home/profile/views/profile_view.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(StringConstants.dashboard,
            style: context.textTheme.labelLarge?.copyWith(
              fontSize: 50.sp,
              color: context.theme.colorScheme.primaryContainer,
            )),
        backgroundColor: context.theme.colorScheme.primary,
        actions: [
          IconButton(
              onPressed: () {
                controller.onLogoutTap();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
          child: PageView(
        controller: controller.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ChatListView(),
          ProfileView(),
        ],
      )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            onTap: (value) {
              controller.onBottomTabChange(value);
            },
            currentIndex: controller.currentIndex.value,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'chat'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
            ]),
      ),
    );
  }
}
