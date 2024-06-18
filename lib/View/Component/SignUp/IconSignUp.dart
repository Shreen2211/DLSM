import 'package:flutter/material.dart';

class IconSignUp extends StatelessWidget {
  const IconSignUp(
      {super.key,
      required this.onTap,
      required this.icon,
      this.size = 30,
      this.color});

  final void Function()? onTap;
  final IconData? icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Icon(
          icon,
          size: size,
          color: color!,
        ),
      ),
    );
  }
}
