import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';

class ShowPass extends StatelessWidget {
   const ShowPass({super.key,required this.onPressed,required this.passBool});
   final void Function()? onPressed;
   final bool passBool;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
       passBool
            ? Icons.visibility
            : Icons.visibility_off,
        color: passBool
            ? Colors.grey
            : ColorCustom.red,
      ),
    );
  }
}
