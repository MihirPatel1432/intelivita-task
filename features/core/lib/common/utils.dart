import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  Utils._();
  static const animationDuration = Duration(milliseconds: 200);

  static displayFlushBar(String? message) {
    Fluttertoast.showToast(
      msg: message ?? '',
    );
  }
}
