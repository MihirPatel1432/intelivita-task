import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/dashboard_export.dart';



class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.posts,
            style: context.textTheme.labelLarge?.copyWith(
              fontSize: 50.sp,
              color: context.theme.colorScheme.primaryContainer,
            )),
        backgroundColor: context.theme.colorScheme.primary,
        actions: [
          InkWell(
            onTap: () => controller.sharedPreferenceService.logoutUser(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
          bottom: false,
          child: Container()),
    );
  }
}

