import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/profile/controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25.h),
        AppTextField(
            controller: controller.nameController,
            label: StringConstants.name,
            onChanged: (value) {
              controller.checkData();
            }),
        SizedBox(height: 25.h),
        AppTextField(
            textInputType: TextInputType.number,
            controller: controller.phoneNumberController,
            label: StringConstants.phoneNumber,
            onChanged: (value) {
              controller.checkData();
            }),
        SizedBox(height: 25.h),
        AppTextField(
            controller: controller.emailController,
            label: StringConstants.email,
            onChanged: (value) {}),
        Spacer(),
        Obx(
          () => AppButton(
              isEnabled: controller.isSaveEnable.value,
              text: StringConstants.save,
              onTap: () {
                controller.onSaveTap();
              }),
        )
      ],
    ).paddingSymmetric(horizontal: 16.w, vertical: 20.h);
  }
}
