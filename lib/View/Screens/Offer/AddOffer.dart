import 'package:dlsm/Model/Request/RequestModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';
import '../../../ViewModel/Data/Local/SharedKey.dart';
import '../../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../../../ViewModel/Utils/colorCustom.dart';
import '../../../i10l/locale_keys.g.dart';
import '../../Component/Button/ButtonCustom.dart';
import '../../Component/Input/InputCustom.dart';
import '../../Component/TitleAnimation/TitleAnimation.dart';

class AddOffer extends StatelessWidget {
  AddOffer({super.key, required this.req});

 final RequestModel req;
  final GlobalKey<FormState> _formKeyOffer = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            // Shadow color
            spreadRadius: 10,
            // Spread radius
            blurRadius: 5,
            // Blur radius
            offset: const Offset(3, 3), // Offset in x and y direction
          ),
        ],
        color: ColorCustom.binkPowder,
        borderRadius: BorderRadiusDirectional.circular(15),
      ),
      child: BlocConsumer<ReqAndOfferCubit, ReqAndOfferState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = ReqAndOfferCubit.get(context);
          return Form(
            key: _formKeyOffer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TitleAnimation(
                  title: 'Add New Offer',
                ),
                InputCustom(
                  controller: cubit.destinationController,
                  inputName: LocaleKeys.from.tr(),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please Enter Location of This Offer';
                    }
                    return null;
                  },
                ),
                InputCustom(
                  controller: cubit.destinationTwoController,
                  inputName: LocaleKeys.to.tr(),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please Enter Destination of This Offer';
                    }
                    return null;
                  },
                ),
                Visibility(
                    //visible: req.typeOfInternational == '2',
                    child: Column(
                  children: [
                    InputCustom(
                      controller: cubit.oceanFreightController,
                      inputName: 'O|F',
                      keyboardType: TextInputType.text,
                    ),
                    InputCustom(
                        controller: cubit.thcController,
                        inputName: 'THC',
                        keyboardType: TextInputType.text),
                    InputCustom(
                        controller: cubit.transTimeController,
                        inputName: 'T.T',
                        keyboardType: TextInputType.text),
                    InputCustom(
                        controller: cubit.freeTimeController,
                        inputName: 'F.T',
                        keyboardType: TextInputType.text),
                    InputCustom(
                        controller: cubit.powerPerDayController,
                        inputName: 'P/D',
                        keyboardType: TextInputType.text),
                    InputCustom(
                        controller: cubit.bLController,
                        inputName: 'B.L',
                        keyboardType: TextInputType.text),
                  ],
                )),
                InputCustom(
                  controller: cubit.totalPriceController,
                  inputName: 'Total',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please Enter Total Price';
                    }
                    return null;
                  },
                ),
                InputCustom(
                    controller: cubit.extraFeesController,
                    inputName: 'Extra Fees',
                    keyboardType: TextInputType.text),
                InputCustom(
                    controller: cubit.truckingPrice,
                    inputName: 'trucking Price',
                    keyboardType: TextInputType.text),
                InputCustom(
                    controller: cubit.customsPrice,
                    inputName: 'CustomsPrice',
                    keyboardType: TextInputType.text),
                InputCustom(
                    controller: cubit.commentController,
                    maxL: 5,
                    mini: 3,
                    inputName: LocaleKeys.comment.tr(),
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 25,
                ),
                ButtonCustom(
                    text: 'Give Offer',
                    onPressed: () {
                      if (_formKeyOffer.currentState!.validate()) {
                        int id = LocalData.get(key: SharedKey.currentUserID);
                        cubit.postOffer(
                          idRequest: req.id,
                          idAgent: id,
                        );
                      }
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
