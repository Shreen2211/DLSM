import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  ShowToast({required this.msg});

  final String msg;

   void show() {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      timeInSecForIosWeb: 10,
      textColor: Colors.white,
    );
  }
}
