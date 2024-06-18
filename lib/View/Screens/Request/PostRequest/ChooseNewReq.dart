import 'package:dlsm/View/Component/Constant/Navigation.dart';
import 'package:dlsm/View/Screens/Request/PostRequest/DHL_Request.dart';
import 'package:dlsm/View/Screens/Request/PostRequest/Local_Request.dart';
import 'package:dlsm/View/Screens/Request/PostRequest/international_Request.dart';
import 'package:dlsm/ViewModel/Utils/colorCustom.dart';
import 'package:flutter/material.dart';

import '../../../../ViewModel/Utils/Img_Custom.dart';
import '../../../Component/Background/SignBackground.dart';
import '../../../Component/Button/ButtonCustom.dart';
import '../../../Component/TitleAnimation/TitleAnimation.dart';
import '../../../Component/TopScreen/TopScreenCustom.dart';

class ChooseRequest extends StatelessWidget {
  const ChooseRequest({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> text = [
      'DHL Request',
      'International Request',
      'Local Request'
    ];
    List<void Function()> onTap = [
      () => Navigation.push(context, const DHL()),
      () => Navigation.push(context, const International()),
      () => Navigation.push(context, const LocalRequest()),
    ];
    return SignBackground(
      backgroundPhoto: ImgCustom.imgLogin,
      newScreen: SingleChildScrollView(
        child: Column(
          children: [
            const TopScreenCustom(
              pageShow: '',
              pageTwo: 'Request',
              show: false,
            ),
            Container(
              padding: const EdgeInsets.all(25),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TitleAnimation(title: 'Type Request'),
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
