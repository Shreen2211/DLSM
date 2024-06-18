import 'package:dlsm/View/Component/Constant/Navigation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ViewModel/Bloc/AuthCubit/auth_cubit.dart';
import '../../../ViewModel/Data/Local/SharedKey.dart';
import '../../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../../i10l/locale_keys.g.dart';
import '../../Component/Background/SignBackground.dart';
import '../../Component/Button/ButtonCustom.dart';
import '../../Component/SignUp/EmailAndPassCustom.dart';
import '../../Component/SignUp/SignUpIcons.dart';
import '../../Component/Text/TextButton.dart';
import '../../Component/TitleAnimation/TitleAnimation.dart';
import '../Home/bottomNavigation.dart';
import 'ForgetPassword.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TitleAnimation(title: LocaleKeys.login.tr()),
                        const EmailAndPass(),
                        ButtonText(
                          text: LocaleKeys.forgetPassword.tr(),
                          onTap: () {
                            Navigation.push(context, const ForgetPassword());
                          },
                        ),
                        ButtonCustom(
                            text: LocaleKeys.login.tr(),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await cubit.login(context).then((value) {
                                  print(cubit.currentUserID);
                                  LocalData.set(
                                      key: SharedKey.currentUserID,
                                      value: cubit.currentUserID);
                                  print(cubit.currentUserType);
                                  LocalData.set(
                                      key: SharedKey.currentUserType,
                                      value: cubit.currentUserType);
                                  LocalData.set(
                                      key: SharedKey.isLogin, value: true);
                                  if (cubit.currentUserID != null) {
                                    Navigation.replace(
                                        context, const MyHomePage());
                                    cubit.clear();
                                  }
                                });
                              }
                            }),
                        const SignUpIcons(),
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