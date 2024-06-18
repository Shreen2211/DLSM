import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final Color? colorText;
  final Color? backGround;
  final double? width;
  final double? height;
  final void Function()? onPressed;

  const ButtonCustom(
      {super.key,
      required this.text,
      this.height,
      this.onPressed,
      this.backGround,
      this.width,
      this.colorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backGround ?? ColorCustom.red,
              fixedSize: Size(width ?? double.infinity, height??60),
              textStyle: const TextStyle(fontSize: 20)),
          onPressed: onPressed,
          child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(color: colorText),
              )),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
