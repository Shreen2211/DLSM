import 'package:dlsm/View/Component/Background/AppBar.dart';
import 'package:dlsm/View/Component/Text/TitleCustom.dart';
import 'package:dlsm/View/Component/TitleAnimation/TitleAnimation.dart';
import 'package:dlsm/ViewModel/Utils/colorCustom.dart';
import 'package:flutter/material.dart';

import '../../Component/TopScreen/TopScreenCustom.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>>aboutUs = [
      {
        'icon': const Icon(
          Icons.location_on_outlined,
          size: 40,
          color: ColorCustom.white,
        ),
        'Name': 'Location',
        'description': 'Cairo , Egypt ',
      },{
        'icon': const Icon(
          Icons.support_agent_rounded,
          size: 40,
          color: ColorCustom.white,
        ),
        'Name': 'Support',
        'description': '01140814892 \n 01211258217 \n 01003951434',
      },{
        'icon': const Icon(
          Icons.email_outlined,
          size: 40,
          color: ColorCustom.white,
        ),
        'Name': 'Email',
        'description': 'Shreenahmed22@gmail.com\nDinamohamed@gmail.com\nmohamedTarek@gmail.com',
      }
    ];
    return ConstantTopic(
        newScreen: SingleChildScrollView(
      child: Column(
        children: [
          const TopScreenCustom(
              pageTwo: 'About US', pageShow: 'nothing', show: false),
          const SizedBox(
            height: 20,
          ),
          const TitleAnimation(title: 'Contact information'),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: ColorCustom.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorCustom.red,
                      child: aboutUs[index]['icon'],
                      radius: 50,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextTitle(text: aboutUs[index]['Name']),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(aboutUs[index]['description']),
                  ],
                ),
              );
            },
            shrinkWrap: true,
            itemCount: aboutUs.length,
          )
        ],
      ),
    ));
  }
}
