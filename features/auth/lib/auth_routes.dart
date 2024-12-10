import 'package:core/core.dart';
import 'package:auth/export.dart';

class AuthRoutes{
  AuthRoutes._();
  static final routes = [
    GetPage(
      name: AllRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    )
  ];
}