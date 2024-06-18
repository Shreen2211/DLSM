import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';
import '../../../i10l/locale_keys.g.dart';
import '../DropDownList/DropDown.dart';
import '../Input/InputCustom.dart';

class CountriesList extends StatelessWidget {
  const CountriesList({super.key,this.show=false});

   final bool? show;

  @override
  Widget build(BuildContext context) {
    var cubit = ReqAndOfferCubit.get(context);
    return Column(
      children: [
        DropDown(
            typeList: cubit.countriesLocation, nameList: 'Country Location'),
        InputCustom(
            controller: cubit.destinationController,
            inputName: LocaleKeys.from.tr(),
            keyboardType: TextInputType.text),
        Visibility(
          visible: show!,
          child: DropDown(
              typeList: cubit.countriesLocationTwo,
              nameList: 'Country Destination'),
        ),
        InputCustom(
            controller: cubit.destinationTwoController,
            inputName: LocaleKeys.to.tr(),
            keyboardType: TextInputType.text),
        InputCustom(
            controller: cubit.goodsTypeController,
            inputName: LocaleKeys.type.tr(),
            keyboardType: TextInputType.text),
      ],
    );
  }
}
