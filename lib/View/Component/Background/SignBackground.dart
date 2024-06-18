import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';


class SignBackground extends StatelessWidget {
  final Widget newScreen;
  final String backgroundPhoto;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;

  const SignBackground(
      {required this.newScreen,
      this.appBar,
      this.drawer,
      required this.backgroundPhoto,
      this.backgroundColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(children: [
        Opacity(
          opacity: 0.3,
          child: Image.asset(
            backgroundPhoto,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
            appBar: appBar,
            drawer: drawer,
            backgroundColor: ColorCustom.layer,
            body: newScreen),
      ]),
    );
  }
}
