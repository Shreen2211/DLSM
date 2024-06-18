import 'package:flutter/material.dart';

import '../../../ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';
import '../../../ViewModel/Utils/colorCustom.dart';

class Check extends StatelessWidget {
  const Check({super.key, required this.value,required this.text,this.checkNum});

  final bool? value;
  final int? checkNum;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          checkColor: ColorCustom.white,
          activeColor: ColorCustom.red,
          value:value,
          onChanged: (value) {
            ReqAndOfferCubit.get(context).changeCheckBox(checkNum!);
          },
        ),
        Text(text!),
      ],
    );
  }
}
