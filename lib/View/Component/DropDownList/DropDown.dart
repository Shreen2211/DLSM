import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Model/ListDataDrop/DropListData.dart';
import '../../../ViewModel/Bloc/AuthCubit/auth_cubit.dart';
import '../../../ViewModel/Bloc/DataRegisterCubit/display_data_cubit.dart';
import '../../../ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';
import '../../../i10l/locale_keys.g.dart';
import '../Button/ButtonDateYear.dart';
import '../Input/InputCustom.dart';
import '../TakePhoto/TakePhotoCustom.dart';

class DropDown extends StatefulWidget {
  final List<String>? typeList;
  final String? nameList;

  const DropDown({Key? key, required this.typeList, this.nameList})
      : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _dropDownValue;

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = AuthCubit.get(context);
    ReqAndOfferCubit reqCountry = ReqAndOfferCubit.get(context);
    ListData listData =
        ListData(authCubit: authCubit, req: reqCountry, context: context);
    return BlocConsumer<DisplayDataCubit, DisplayDataState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 60,
              child: DottedBorder(
                color: Colors.black54,
                strokeWidth: 1,
                dashPattern: const [3, 2],
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    padding: const EdgeInsets.all(10),
                    dropdownColor: Colors.white,
                    style: const TextStyle(color: Colors.grey),
                    isExpanded: true,
                    iconSize: 35,
                    menuMaxHeight: 300,
                    hint: _dropDownValue == null
                        ? Text(widget.nameList ?? LocaleKeys.typeClient.tr())
                        : Text(_dropDownValue!),
                    value: _dropDownValue,
                    items: widget.typeList
                        ?.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        })
                        .toSet()
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _dropDownValue = value;
                        AuthCubit.get(context).showData.clear();
                        AuthCubit.get(context).showPhoto.clear();
                        if (widget.typeList == reqCountry.countriesLocation) {
                          reqCountry.changCountryLocation(_dropDownValue);
                        } else if (widget.typeList ==
                            reqCountry.countriesLocationTwo) {
                          reqCountry.changCountryTwo(_dropDownValue);
                        } else if (_dropDownValue == LocaleKeys.user.tr()) {
                          AuthCubit.get(context)
                              .showData
                              .addAll(listData.getInputUser());
                          AuthCubit.get(context)
                              .showPhoto
                              .addAll(listData.getInputPhotoUser());
                          AuthCubit.get(context).table(1);
                        } else if (_dropDownValue ==
                            LocaleKeys.shippingCompany.tr()) {
                          AuthCubit.get(context).table(2);
                          AuthCubit.get(context)
                              .showData
                              .addAll(listData.getInputConfigs());
                          AuthCubit.get(context)
                              .showData
                              .addAll(listData.getInputShipping());
                        } else if (_dropDownValue ==
                            LocaleKeys.imAndExCompany.tr()) {
                          AuthCubit.get(context).table(3);
                          AuthCubit.get(context)
                              .showData
                              .addAll(listData.getInputConfigs());
                          AuthCubit.get(context)
                              .showData
                              .addAll(listData.getInputCompany());
                          /*AuthCubit.get(context)
                              .showPhoto
                              .addAll(listData.getInputPhotoCompany());*/
                        } else if (_dropDownValue == LocaleKeys.factory.tr()) {
                          AuthCubit.get(context)
                              .showData
                              .addAll(listData.getInputConfigs());
                          AuthCubit.get(context)
                              .showData
                              .addAll(listData.getInputCompany());
                          AuthCubit.get(context)
                              .showPhoto
                              .addAll(listData.getInputPhotoCompany());
                          AuthCubit.get(context).table(4);
                        } else if (_dropDownValue == 'Wild') {
                          reqCountry.putTrans('1');
                          AuthCubit.get(context)
                              .showData
                              .addAll(listData.getInputWild());
                        } else if (_dropDownValue == 'Ocean') {
                          reqCountry.putTrans('2');
                          AuthCubit.get(context)
                              .showData
                              .addAll(listData.getInputOcean());
                        } else if (_dropDownValue == 'Air') {
                          reqCountry.putTrans('3');
                          AuthCubit.get(context)
                              .showData
                              .addAll(listData.getInputAir());
                        } else if (_dropDownValue == 'Best Case') {
                          /* ReqAndOfferCubit.get(context)
                              .putTrans('3');*/
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Visibility(
              visible: widget.typeList == ListData.typeUserList ||
                  widget.typeList == ListData.typeInternational,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AuthCubit.get(context).showData.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> config =
                      AuthCubit.get(context).showData[index];
                  return InputCustom(
                    controller: config['controller'],
                    inputName: config['inputName'],
                    keyboardType: config['keyboardType'],
                    suffixIcon: config['suffix'],
                  );
                },
              ),
            ),
            Visibility(
                visible: _dropDownValue == LocaleKeys.shippingCompany.tr(),
                child: const ButtonYear()),
            const SizedBox(
              height: 25,
            ),
            Visibility(
              visible: widget.typeList == ListData.typeUserList,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AuthCubit.get(context).showPhoto.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> config =
                      AuthCubit.get(context).showPhoto[index];
                  return TakePhotoCustom(
                    text: config['text'],
                    name: config['name'],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}