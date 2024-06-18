import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.text,this.fontWeight, this.color, this.fontSize});

  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        fontSize: fontSize ?? 35,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
