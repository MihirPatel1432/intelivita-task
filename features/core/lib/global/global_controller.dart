import 'package:core/services/progress_service.dart';
import 'package:core/services/shared_preference_service.dart';
import 'package:get/get.dart';

mixin GlobalController {
  ProgressService get progressService => Get.find();

  SharedPreferenceService get sharedPreferenceService => Get.find();

}
