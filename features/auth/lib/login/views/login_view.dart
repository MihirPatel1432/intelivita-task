import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:auth/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  StringConstants.loginTitle,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.labelLarge?.copyWith(
                    fontSize: 50.sp
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              AppButton(text: 'Login with Google', onTap: (){
                controller.googleSignBtnTap();
              })
            ],
          ),
        ),
      ),
    );
  }
}
