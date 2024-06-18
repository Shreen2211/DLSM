import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../../i10l/locale_keys.g.dart';
import '../../Component/Background/SignBackground.dart';
import '../../Component/Button/ButtonCustom.dart';
import '../../Component/SignUp/EmailAndPassCustom.dart';
import '../../Component/SignUp/SignUpIcons.dart';
import '../../Component/TitleAnimation/TitleAnimation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SignBackground(
      backgroundPhoto: ImgCustom.imgLogin,
      newScreen: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(25),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleAnimation(title: LocaleKeys.forgetPassword.tr()),
              const EmailAndPass(confirmPass: true),
              ButtonCustom(
                  text: LocaleKeys.confirmPassword.tr(),
                  onPressed: () {
                    //Navigation.push(context, const HomeScreen());
                  }),
              const SignUpIcons(),
            ],
          ),
        ),
      ),
    );
  }
}
