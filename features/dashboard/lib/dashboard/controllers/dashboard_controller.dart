import 'package:core/core.dart';
import 'package:core/global/global_controller.dart';
import 'package:home/dashboard_export.dart';


class DashboardController extends GetxController with GlobalController {
  final MainRepository repository;
  RxBool isLoading = true.obs;

  DashboardController(this.repository);

}
