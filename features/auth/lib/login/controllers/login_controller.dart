import 'package:core/core.dart';
import 'package:core/global/global_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController with GlobalController {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      progressService.showProgressDialog(true);
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      AppLogger.e(e);
      return null;
    } finally {
      progressService.showProgressDialog(false);
    }
  }

  void googleSignBtnTap() async {
    var data = await signInWithGoogle();
    if (data != null) {
      _storeUserData(data.user);
    } else {
      Utils.displayFlushBar(StringConstants.errSomethingWentWrongTryAgain);
    }
  }

  Future<void> _storeUserData(User? user) async {
    await FirebaseApi.storeUserDataToFirestore(user);
    sharedPreferenceService.setLoggedInStatus(true);
    Get.toNamed(AllRoutes.dashboard);
  }
}
