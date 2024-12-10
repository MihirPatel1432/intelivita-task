import 'package:core/core.dart';

import 'package:home/dashboard_export.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    DependencyProvider.registerSingleton<MainRepository>(
        MainRepositoryImpl(),
        permanent: true);
    DependencyProvider.registerSingleton<DashboardController>(
        DashboardController(DependencyProvider.get()));
  }
}
