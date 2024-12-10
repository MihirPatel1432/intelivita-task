import 'package:core/core.dart';
import 'package:home/dashboard_export.dart';

class DashboardRoutes {
  DashboardRoutes._();

  static final routes = [
    GetPage(
      page: () => const DashboardView(),
      name: AllRoutes.root,
      binding: DashboardBinding(),
    )
  ];
}
