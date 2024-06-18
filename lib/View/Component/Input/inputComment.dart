import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';
import '../../../i10l/locale_keys.g.dart';
import 'InputCustom.dart';

class InputComment extends StatelessWidget {
  const InputComment({super.key});

  @override
  Widget build(BuildContext context) {
    return InputCustom(
        maxL: 5,
        mini: 3,
        controller: ReqAndOfferCubit.get(context).commentController,
        inputName: LocaleKeys.comment.tr(),
        keyboardType: TextInputType.text);
  }
}
