import 'package:dlsm/View/Component/Text/TitleCustom.dart';
import 'package:dlsm/ViewModel/Utils/Img_Custom.dart';
import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';

class TopScreenCustom extends StatelessWidget {
  const TopScreenCustom(
      {super.key,
      required this.pageTwo,
      required this.pageShow,
      required this.show});

  final String? pageTwo;
  final String? pageShow;
  final bool show;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImgCustom.topScreen),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const TextTitle(text: 'Home ', color: ColorCustom.white, fontSize: 25),
                  const TextTitle(text: ' ❯❯', color: ColorCustom.red, fontSize: 23),
                  Flexible(
                    child: TextTitle(
                        text: ' $pageTwo', color: ColorCustom.white, fontSize: 22),
                  ),
                  Visibility(
                      visible: show,
                      child: Row(
                        children: [
                          const TextTitle(
                              text: ' ❯❯ ', color: ColorCustom.red, fontSize: 25),
                          TextTitle(
                              text: ' $pageShow ',
                              color: ColorCustom.gray,
                              fontSize: 26),
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
