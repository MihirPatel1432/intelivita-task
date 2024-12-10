import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:auth/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100.h,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    StringConstants.loginTitle,
                    textAlign: TextAlign.start,
                    style: context.theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
