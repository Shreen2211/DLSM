import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';

class AddInfo extends StatelessWidget {
  const AddInfo({super.key,this.icon,this.text});

  final IconData? icon ;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(
          icon,
          color: ColorCustom.white,
          size: 30,
        ),
        const SizedBox(width: 15),
        Flexible(
          child: Text(
            text!,
            style: const TextStyle(
              color: ColorCustom.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
