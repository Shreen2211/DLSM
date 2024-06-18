import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Model/ListDataDrop/DropListData.dart';
import '../../../ViewModel/Bloc/AuthCubit/auth_cubit.dart';
import '../../../ViewModel/Data/Local/SharedKey.dart';
import '../../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../../i10l/locale_keys.g.dart';
import '../../Component/Background/SignBackground.dart';
import '../../Component/Button/ButtonCustom.dart';
import '../../Component/DropDownList/DropDown.dart';
import '../../Component/Input/InputCustom.dart';
import '../../Component/SignUp/EmailAndPassCustom.dart';
import '../../Component/TitleAnimation/TitleAnimation.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SignBackground(
      backgroundPhoto: ImgCustom.imgLogin,
      newScreen: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(25),
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _formKeyRegister,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TitleAnimation(title: LocaleKeys.register.tr()),
                        InputCustom(
                          controller: cubit.nameController,
                          inputName: LocaleKeys.name.tr(),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return '${LocaleKeys.please.tr()} ${LocaleKeys.name.tr()}';
                            }
                            return null;
                          },
                        ),
                        const EmailAndPass(confirmPass: true),
                        InputCustom(
                          controller: cubit.phoneNumberController,
                          inputName: LocaleKeys.phoneNumber.tr(),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return '${LocaleKeys.please.tr()} ${LocaleKeys.phoneNumber.tr()}';
                            }
                            return null;
                          },
                        ),
                        DropDown(
                          typeList: ListData.typeUserList,
                        ),
                        ButtonCustom(
                          text: LocaleKeys.register.tr(),
                          onPressed: () async {
                            if (_formKeyRegister.currentState!.validate()) {
                              cubit.postReg(context);
                              LocalData.set(
                                  key: SharedKey.isLogin, value: true);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}