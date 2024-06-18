import 'package:dlsm/View/Screens/Service/Air.dart';
import 'package:dlsm/View/Screens/Service/Ocean.dart';
import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';
import '../../Component/Background/AppBar.dart';

import '../../Component/Button/ButtonCustom.dart';
import '../../Component/Constant/Navigation.dart';
import '../../Component/TitleAnimation/TitleAnimation.dart';
import '../../Component/TopScreen/TopScreenCustom.dart';
import 'Road.dart';

class ChooseService extends StatelessWidget {
  ChooseService({super.key});

  final List<String> text = ['Road Service', 'Ocean Service', 'Air Service'];

  @override
  Widget build(BuildContext context) {
    List<void Function()> onTap = [
      () => Navigation.push(context, const RoadService()),
      () => Navigation.push(context, const OceanService()),
      () => Navigation.push(context, const AirService()),
    ];
    return ConstantTopic(
      newScreen: SingleChildScrollView(
        child: Column(
          children: [
            const TopScreenCustom(
              pageShow: '',
              pageTwo: 'Service',
              show: false,
            ),
            Container(
              padding: const EdgeInsets.all(25),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TitleAnimation(title: 'Type Service'),
                  ListView.builder(
                    itemCount: text.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ButtonCustom(
                        colorText: ColorCustom.red,
                        backGround: ColorCustom.white,
                        text: text[index],
                        onPressed: onTap[index],
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
