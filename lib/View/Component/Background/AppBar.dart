import 'package:dlsm/View/Component/Constant/Navigation.dart';
import 'package:flutter/material.dart';
import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../../ViewModel/Utils/colorCustom.dart';
import '../../Screens/Home/Search.dart';
import 'Drawer.dart';
import 'SignBackground.dart';

class ConstantTopic extends StatelessWidget {
  const ConstantTopic({super.key, this.bottom, required this.newScreen});

 final PreferredSizeWidget? bottom;
 final Widget newScreen;

  @override
  Widget build(BuildContext context) {
    return SignBackground(
      newScreen: newScreen,
      drawer: const DrawerCustom(),
      backgroundPhoto: ImgCustom.imgLogin,
      appBar: AppBar(
        bottom: bottom,
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        title: Image.asset(ImgCustom.imgLogo, height: 60),
        backgroundColor: ColorCustom.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigation.push(context,const ShippingCompanyScreen());
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
