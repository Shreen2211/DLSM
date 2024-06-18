import 'package:dlsm/View/Component/Button/ButtonCustom.dart';
import 'package:dlsm/View/Component/Constant/Navigation.dart';
import 'package:dlsm/ViewModel/Utils/colorCustom.dart';
import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/Img_Custom.dart';

import '../../Component/Background/SignBackground.dart';
import '../Sign/Login_Screen.dart';

class OnboaredingScreen extends StatefulWidget {
  const OnboaredingScreen({super.key});

  @override
  State<OnboaredingScreen> createState() => _OnboaredingScreenState();
}

class _OnboaredingScreenState extends State<OnboaredingScreen> {
  PageController newPage = PageController();
  int pageNum = 0;
  List<String> nameIamage = [
    ImgCustom.onBoardingOne,
    ImgCustom.roadService,
    ImgCustom.onBoardingTwo,
  ];

  List<String> qoute = [
    'Delivering More Than Just Packages.',
    'You Trust, We Deliver.',
    'Express Shipping, Expressed Here.'
  ];

  @override
  Widget build(BuildContext context) {
    return SignBackground(
        backgroundPhoto: ImgCustom.imgLogin,
        newScreen: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              pageNum = value;
            });
          },
          controller: newPage,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ));
                      },
                      child: const Text('Skip',
                          style: TextStyle(color: Colors.grey, fontSize: 20)),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        image: AssetImage(nameIamage[pageNum]),
                        fit: BoxFit.fill,
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    qoute[pageNum],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: pageNum == 0 ? 10 : 5,
                        backgroundColor:
                            pageNum == 0 ? ColorCustom.red : ColorCustom.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: pageNum == 1 ? 10 : 5,
                        backgroundColor:
                            pageNum == 1 ? ColorCustom.red : ColorCustom.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: pageNum == 2 ? 10 : 5,
                        backgroundColor:
                            pageNum == 2 ? ColorCustom.red : ColorCustom.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ButtonCustom(
                      width: 120,
                      text: pageNum == 2 ? 'Get Start' : 'Next',
                      onPressed: () {
                        if (pageNum != 2) {
                          newPage.animateToPage(pageNum + 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        } else {
                          Navigation.push(context, LoginScreen());
                        }
                      }),
                ],
              ),
            );
          },
        ));
  }
}
