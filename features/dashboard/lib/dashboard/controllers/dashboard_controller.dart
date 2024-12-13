import 'package:core/core.dart';
import 'package:core/global/global_controller.dart';
import 'package:flutter/cupertino.dart';

class DashboardController extends GetxController with GlobalController {
  PageController? pageController;
  RxInt currentIndex = 0.obs;

  DashboardController();

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0,keepPage: true);
  }

  Future<void> onLogoutTap() async {
    sharedPreferenceService.clearData();
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(AllRoutes.login);
  }

  Future<void> onBottomTabChange(int selectedIndex) async {
    currentIndex.value = selectedIndex;
    await pageController?.animateToPage(
      selectedIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
