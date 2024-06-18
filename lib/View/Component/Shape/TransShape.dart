import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';

class TransformShape extends StatelessWidget {
  const TransformShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              transform: Matrix4.skewX(-10),
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                color: ColorCustom.red,
                width: 60,
                height: 5,
              ),
            ),
            Transform(
              transform: Matrix4.skewX(-10),
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                color: const Color(0xffF3B2B4),
                width: 30,
                height: 5,
              ),
            ),
            Transform(
              transform: Matrix4.skewX(-10),
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                color: const Color(0xffF3B2B4),
                width: 30,
                height: 5,
              ),
            ),
            Transform(
              transform: Matrix4.skewX(-10),
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                color: const Color(0xffF3B2B4),
                width: 30,
                height: 5,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
