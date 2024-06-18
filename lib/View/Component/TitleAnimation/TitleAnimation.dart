import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';
import '../Animation/SimpleAnimation.dart';
import '../Text/TitleCustom.dart';

class TitleAnimation extends StatelessWidget {
  const TitleAnimation({super.key, this.fontWeight,required this.title, this.color,this.size,this.colorAni});

  final String title;
  final Color? color;
  final Color? colorAni;
  final FontWeight? fontWeight;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextTitle(
          text: title,
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
        ),
         SimpleAni(
          color2: colorAni??ColorCustom.white,
        ),
      ],
    );
  }
}
