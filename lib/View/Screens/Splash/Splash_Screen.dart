import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dlsm/ViewModel/Utils/Img_Custom.dart';
import 'package:dlsm/ViewModel/Utils/colorCustom.dart';
import 'package:flutter/material.dart';

import '../../../ViewModel/Data/Local/SharedKey.dart';
import '../../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../Home/bottomNavigation.dart';
import '../Onboarding/Onboard.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(LocalData.get(key: SharedKey.currentUserID));
    print(LocalData.get(key: SharedKey.currentUserType));
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Image.asset(ImgCustom.imgLogo, color: ColorCustom.red),
      nextScreen: (LocalData.get(key: SharedKey.isLogin) ?? false)
          ?  const MyHomePage()
          : const OnboaredingScreen(),
      splashIconSize: 350,
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: ColorCustom.binkPowder,
    );
  }
}
