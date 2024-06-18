import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ViewModel/Bloc/AuthCubit/auth_cubit.dart';
import '../../../i10l/locale_keys.g.dart';
import '../Input/InputCustom.dart';
import '../ShowPassword/ShowPassword.dart';

class EmailAndPass extends StatelessWidget {
   const EmailAndPass({super.key,this.confirmPass=false});
   final bool confirmPass;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Column(
          children: [
            InputCustom(
              controller: cubit.emailController,
              inputName: LocaleKeys.email.tr(),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return '${LocaleKeys.please.tr()} ${LocaleKeys.email.tr()}';
                }
                return null;
              },
            ),
            InputCustom(
              controller: cubit.passwordController,
              obscureText: cubit.obscurePassLogin,
              suffixIcon: ShowPass(
                  onPressed: () {
                    cubit.showPassword();
                  },
                  passBool: cubit.obscurePassLogin),
              inputName: LocaleKeys.password.tr(),
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return '${LocaleKeys.please.tr()} ${LocaleKeys.password
                      .tr()}';
                }
                return null;
              },
            ),
            Visibility(
              visible: confirmPass,
              child: InputCustom(
                  controller: cubit.passwordConfirmController,
                  obscureText: cubit.obscureConfirmPassRegister,
                  inputName: LocaleKeys.confirmPassword.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return '${LocaleKeys.please.tr()} ${LocaleKeys.confirmPassword.tr()}';
                    }
                    return null;
                  },
                  suffixIcon: ShowPass(
                    onPressed: () {
                      cubit.showConfirmPassword();
                    },
                    passBool: cubit.obscureConfirmPassRegister,
                  )),
            ),
          ],
        );
      },
    );
  }
}
