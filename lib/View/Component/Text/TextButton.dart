import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';

class ButtonText extends StatelessWidget {
  const ButtonText({super.key, required this.text, this.onTap, this.fontSize});

  final  String text;
  final  void Function()? onTap;
  final  double? fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize ?? 18, color: ColorCustom.red),
      ),
    );
  }
}
