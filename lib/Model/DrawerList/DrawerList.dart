import 'package:flutter/material.dart';
import '../../View/Component/Alert/AlertDialog.dart';
import '../../View/Component/Constant/Navigation.dart';
import '../../View/Screens/AboutUs/aboutUs.dart';
import '../../View/Screens/Home/bottomNavigation.dart';
import '../../View/Screens/Profile/EditProfile.dart';
import '../../View/Screens/Service/ChooseService.dart';
import '../../View/Screens/Sign/Login_Screen.dart';
import '../../ViewModel/Data/Local/Shared_Preferences.dart';

class DrawerList {
  static List<Map<String, dynamic>> drawer(BuildContext context) {
    return [
      {
        'title': 'Home',
        'icon': Icons.home,
        'onTap': () {
          Navigation.push(context, const MyHomePage());
        },
      },
      {
        'title': 'Edit Profile',
        'icon': Icons.edit,
        'onTap': () {
          Navigation.push(context, const EditProfile());
        },
      },
      {
        'title': 'Our Service',
        'icon': Icons.interests,
        'onTap': () {
          Navigation.push(context, ChooseService());
        },
      },
      {
        'title': 'About Us',
        'icon': Icons.info_outline_rounded,
        'onTap': () {
          Navigation.push(context, const AboutUs());
        },
      },
      {
        'title': 'LogOut',
        'icon': Icons.logout,
        'onTap': () {
          {
            ShowDialog(
                title: 'LogOut',
                message: 'Are you sure you need logOut your account?',
                context: context,
                onPressedAccept: () {
                  Navigation.push(context, LoginScreen());
                  LocalData.clear();
                }).alert();
          }
        },
      },
    ];
  }
}