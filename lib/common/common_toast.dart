import 'package:fluttertoast/fluttertoast.dart';

commonToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
  );
}
