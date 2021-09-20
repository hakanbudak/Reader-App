import 'package:fluttertoast/fluttertoast.dart';

import '../globals.dart';

class ToastHelper {
  static showToast(String message, [Toast length = Toast.LENGTH_SHORT, bool isError = false]) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: length,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor:
            isError ? Globals.AppBaseErrorColor : Globals.AppBaseThirdColor,
        textColor: Globals.AppBaseReverseColor,
        fontSize: 16.0);
  }
}
