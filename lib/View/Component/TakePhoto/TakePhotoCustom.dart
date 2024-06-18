import 'package:dlsm/View/Component/Text/TitleCustom.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ViewModel/Bloc/AuthCubit/auth_cubit.dart';
import '../../../ViewModel/Bloc/DataRegisterCubit/display_data_cubit.dart';
import '../../../i10l/locale_keys.g.dart';

class TakePhotoCustom extends StatefulWidget {
  final String? text;
  final String? name;

  const TakePhotoCustom({required this.name, required this.text, super.key});

  @override
  State<TakePhotoCustom> createState() => _TakePhotoCustomState();
}

class _TakePhotoCustomState extends State<TakePhotoCustom> {
  String? anything;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DisplayDataCubit, DisplayDataState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DisplayDataCubit.get(context);
        return Column(
          children: [
            DottedBorder(
              strokeWidth: 1,
              color: Colors.black,
              dashPattern: const [3, 2],
              child: InkWell(
                  onTap: () {
                    if (widget.name == LocaleKeys.taxCard.tr()) {
                      cubit.takePhotoTaxCard();
                      anything = cubit.taxCard?.name;
                    }
                    else if (widget.name == LocaleKeys.importCard.tr()) {
                      cubit.takePhotoImportCard();
                      anything = cubit.importCard?.name;
                    }
                    else if (widget.name == LocaleKeys.industrialRecord.tr()) {
                      cubit.takePhotoIndustryCard();
                      anything = cubit.industryCard?.name;
                    }
                    else if (widget.name == LocaleKeys.commercialRecord.tr()) {
                      cubit.takePhotoComCard();
                      anything = cubit.comCard?.name;
                    }else if (widget.name==LocaleKeys.photoProfile.tr()){
                      cubit.takePhotoProfile();
                      anything = cubit.photo?.name;
                      AuthCubit.get(context).photoUser=cubit.photo!.name;
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    height: 60,
                    color: Colors.white,
                    child: Row(
                      children: [
                        const Icon(Icons.add_photo_alternate_outlined),
                        const SizedBox(width: 15,),
                        TextTitle(
                            text: anything ?? widget.text ?? '',
                            color: Colors.grey,
                            fontSize: 15),
                      ],
                    ),
                  )),
            ),
            const SizedBox(height: 25,),
          ],
        );
      },
    );
  }
}
