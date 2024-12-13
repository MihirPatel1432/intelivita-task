import 'package:core/common/strings.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends GetxService {
  SharedPreferences? _pref;
  final String _isLoggedIn = StringConstants.loginPrefKey;

  Future<bool?> clearData() async {
    return _pref?.clear();
  }

  Future<SharedPreferenceService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  bool getLoggedInStatus() => _pref?.getBool(_isLoggedIn) ?? false;

  void setLoggedInStatus(bool isLoggedIn) async{
    _pref = await SharedPreferences.getInstance();
    _pref?.setBool(_isLoggedIn, isLoggedIn);
  }

  Future<void> logoutUser() async => await clearData();
}
