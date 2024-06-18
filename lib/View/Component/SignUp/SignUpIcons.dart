import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';
import '../../../i10l/locale_keys.g.dart';
import '../../Screens/Sign/Register_Screen.dart';
import '../Constant/Navigation.dart';
import '../Text/TextButton.dart';
import 'IconSignUp.dart';

class SignUpIcons extends StatelessWidget {
  const SignUpIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorCustom.red,
                ),
                height: 1,
                width: 150,
              ),
            ),
             Text(
               ' ${LocaleKeys.or.tr()} ',
              style: const TextStyle(
                fontSize: 18,
                color: ColorCustom.red,
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorCustom.red,
                ),
                height: 1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconSignUp(
              onTap: () {},
              icon: Icons.g_mobiledata_outlined,
              size: 50,
              color: ColorCustom.red,
            ),
            IconSignUp(
              onTap: () {},
              icon: Icons.facebook,
              size: 30,
              color: ColorCustom.blue,
            ),
            IconSignUp(
              onTap: () {},
              icon: Icons.apple,
              size: 30,
              color: ColorCustom.black,
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Flexible(child: Text(LocaleKeys.noAccount.tr(),style: const TextStyle(fontSize: 18),)),
            ButtonText(
              text: LocaleKeys.signUpHere.tr(),
              onTap: () {
                Navigation.push(context, RegisterScreen());
              },
            ),
          ],
        ),
      ],
    );
  }
}
