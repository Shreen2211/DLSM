import 'package:flutter/material.dart';

class Navigation{
  static void push(context, Widget newScreen) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => newScreen,)
    );
  }
  static void replace(context, Widget newScreen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => newScreen,)
    );
  }
}