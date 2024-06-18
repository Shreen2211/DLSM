import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'View/Screens/Splash/Splash_Screen.dart';
import 'ViewModel/Bloc/AgentCubit/agent_cubit.dart';
import 'ViewModel/Bloc/AuthCubit/auth_cubit.dart';
import 'ViewModel/Bloc/DataRegisterCubit/display_data_cubit.dart';
import 'ViewModel/Bloc/FeedBackAndRate/feedback_and_rate_cubit.dart';
import 'ViewModel/Bloc/Post/post_cubit.dart';
import 'ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';
import 'ViewModel/Data/Local/Shared_Preferences.dart';
import 'ViewModel/Data/Network/DioHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalData.init();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      fallbackLocale:
          Locale(Platform.localeName.split('_').first.toLowerCase()),
      child: const MyApp(),
    ), // Wrap your app
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DisplayDataCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ), BlocProvider(
          create: (context) => PostCubit(),
        ),
        BlocProvider(
          create: (context) => ReqAndOfferCubit()
            ..getCountries(),
        ),
        BlocProvider(create: (context) => AgentCubit()),
        BlocProvider(create: (context) => FeedbackAndRateCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
//flutter pub run easy_localization:generate -S "assets/translation" -O "lib\i10l" -f keys -o locale_keys.g.dart
//php artisan serve --host=192.168.0.102 --port=8000