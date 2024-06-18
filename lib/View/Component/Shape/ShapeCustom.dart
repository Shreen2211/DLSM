import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';
class Shape extends StatelessWidget {
  const Shape({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewX(-10),
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        color: ColorCustom.red,
        width: 60,
        height: 5,
      ),
    );
  }
}
