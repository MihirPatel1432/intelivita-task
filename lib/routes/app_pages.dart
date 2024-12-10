import 'package:auth/auth_routes.dart';
import 'package:core/core.dart';
import 'package:home/dashboard.dart';

// ignore_for_file: constant_identifier_names

class AppPages {
  AppPages._();

  static const String INITIAL = AllRoutes.root;
  static final routes = [
    ...AuthRoutes.routes,
    ...DashboardRoutes.routes
  ];
}
