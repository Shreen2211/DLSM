import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../ViewModel/Bloc/FeedBackAndRate/feedback_and_rate_cubit.dart';
import '../../../ViewModel/Data/Local/SharedKey.dart';
import '../../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../../../ViewModel/Utils/colorCustom.dart';
import '../../../i10l/locale_keys.g.dart';
import '../Alert/AlertDialog.dart';
import '../Button/ButtonCustom.dart';
import '../Input/InputCustom.dart';
import '../Text/TitleCustom.dart';

class GiveFeedback extends StatelessWidget {
  const GiveFeedback({super.key,required this.rate,this.onTap,this.controller,required this.idClient,required this.idShipper});
  final int rate;
  final int ?idClient;
  final int? idShipper;
  final void Function()? onTap;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: ColorCustom.layerPink,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextTitle(
            text: 'Rate this Trip..',
            color: ColorCustom.red,
            fontSize: 25,
          ),
          Center(
            child: SizedBox(
              height: 60,
              // Set the height of the horizontal ListView
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                // Set scroll direction to horizontal
                itemBuilder: (context, index) {
                  return IconButton(
                    onPressed: () {
                      FeedbackAndRateCubit.get(context).rateChange(index);
                    },
                    icon: Icon(
                      rate >= index
                          ? Icons.star
                          : Icons.star_border,
                      color: ColorCustom.red,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InputCustom(
            maxL: 5,
            mini: 3,
            controller: controller,
            inputName: LocaleKeys.comment.tr(),
            keyboardType: TextInputType.text,
          ),
          ButtonCustom(
            text: 'Send',
            onPressed: () {
              FeedbackAndRateCubit.get(context).postFeedback(
                  idClient: idClient,
                  idShipping: idShipper,
                feedbackType: LocalData.get(key: SharedKey.currentUserID)==idClient?'client':'shipping_company'
              );
              ShowDialog(
                title: 'Thanks',
                context: context,
                onPressedAccept: () {},
              ).done();
            },
          ),
        ],
      ),
    );
  }
}
