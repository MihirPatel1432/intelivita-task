import 'package:core/core.dart';
import 'package:core/global/global_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:home/dashboard_export.dart';

class ProfileController extends GetxController with GlobalController {
  final MainRepository repository;
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  String? savedName;
  String? savedPhoneNumber;
  RxBool isSaveEnable = false.obs;

  ProfileController(this.repository);

  @override
  void onReady() {
    super.onReady();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    var snapshot = await FirebaseApi.fetchMyDetail();

    Map<String, dynamic>? userData = snapshot.data() as Map<String, dynamic>;
    savedName = userData['displayName'] ?? '';
    nameController.text = savedName ?? '';
    savedPhoneNumber = userData['phoneNumber'] ?? '';
    phoneNumberController.text = savedPhoneNumber ?? '';
    emailController.text = userData['email'] ?? '';
  }

  void checkData() {
    if (savedName == nameController.text &&
        savedPhoneNumber == phoneNumberController.text) {
      isSaveEnable.value = false;
    } else {
      isSaveEnable.value = true;
    }
  }

  Future<void> onSaveTap() async {
    if (isValidData()) {
      await updateUserData(nameController.text, phoneNumberController.text);
    }
  }

  Future<void> updateUserData(String newName, String number) async {
    await FirebaseApi.updateUserData(newName, number);
    savedName = newName;
    savedPhoneNumber = number;
    isSaveEnable.value = false;
    Utils.displayFlushBar(StringConstants.successDataUpdated);
  }

  bool isValidData() {
    if (nameController.text.isEmpty) {
      Utils.displayFlushBar(StringConstants.errEnterYourName);
      return false;
    } else if (phoneNumberController.text.isNotEmpty &&
        phoneNumberController.text.length < 10) {
      Utils.displayFlushBar(StringConstants.errEnterValidPhoneNumber);
      return false;
    }
    return true;
  }
}
