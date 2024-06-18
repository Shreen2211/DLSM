import 'package:dlsm/ViewModel/Bloc/AuthCubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Model/ListDataDrop/DropListData.dart';
import '../../../ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';

import '../../../ViewModel/Data/Local/SharedKey.dart';
import '../../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../../../i10l/locale_keys.g.dart';

import '../../Component/Button/ButtonCustom.dart';
import '../../Component/Input/inputComment.dart';
import '../../Component/ShowCountriesList/CountryList.dart';
import '../../Component/TitleAnimation/TitleAnimation.dart';
import '../../Component/TopScreen/TopScreenCustom.dart';
import '../Background/AppBar.dart';
import '../CheckBox/CheckBox.dart';
import '../DropDownList/DropDown.dart';
import '../Input/InputCustom.dart';

class Request extends StatelessWidget {
  const Request({super.key, required this.pageShow, required this.typeReq});

  final String? pageShow;
  final String? typeReq;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReqAndOfferCubit, ReqAndOfferState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ReqAndOfferCubit.get(context);
        ListData listData = ListData(authCubit: AuthCubit.get(context),req: cubit,context: context);
        return  ConstantTopic(
          newScreen: SingleChildScrollView(
              child: Column(
                children: [
                  TopScreenCustom(
                    pageTwo: 'Request',
                    pageShow: pageShow,
                    show: true,
                  ),
                  Container(
                    padding: const EdgeInsets.all(25),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TitleAnimation(title: 'Request $pageShow Quote'),
                        CountriesList(show: typeReq == '3' ? false : true),
                        Visibility(
                          visible: typeReq == '3' || typeReq == '2',
                          child: Column(
                            children: [
                              Check(
                                value:cubit.dangerous,
                                checkNum: 1,
                                text: 'Dangerous',
                              ),
                              Visibility(
                                visible: cubit.dangerous,
                                child: InputCustom(
                                    controller: cubit.safetyController,
                                    inputName: LocaleKeys.safetySheet.tr(),
                                    keyboardType: TextInputType.text),
                              ),
                              InputCustom(
                                  controller: cubit.weightController,
                                  inputName: LocaleKeys.weight.tr(),
                                  keyboardType: TextInputType.text),
                            ],
                          ),
                        ),
                        Visibility(
                            visible: typeReq == '2',
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:listData.getInputInter().length ,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> config =
                                    listData.getInputInter()[index];
                                    return InputCustom(
                                      controller: config['controller'],
                                      inputName: config['inputName'],
                                      keyboardType: config['keyboardType'],
                                    );
                                  },
                                ),
                                DropDown(
                                  typeList: ListData.typeInternational,
                                  nameList: 'Type Transport',
                                ),
                                Check(
                                  value:cubit.tracking,
                                  checkNum: 3,
                                  text: 'Tracking',
                                ),
                                Check(
                                  value:cubit.customClear,
                                  checkNum: 2,
                                  text: 'Custom Clearance',
                                ),
                              ],
                            )),
                        const InputComment(),
                        ButtonCustom(
                            text: 'Submit',
                            onPressed: () {
                              cubit.postRequest(requestType: typeReq, id: LocalData.get(key: SharedKey.currentUserID).toString());
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
} /*LocalData.get(key: SharedKey.currentUserID).toString());*/