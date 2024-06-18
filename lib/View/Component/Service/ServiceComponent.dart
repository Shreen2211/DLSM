import 'package:dlsm/View/Component/Text/TitleCustom.dart';
import 'package:dlsm/ViewModel/Utils/colorCustom.dart';
import 'package:flutter/material.dart';
import '../Animation/SimpleAnimation.dart';
import '../Background/AppBar.dart';
import '../TopScreen/TopScreenCustom.dart';

class ServiceComponent extends StatelessWidget {
  const ServiceComponent({super.key,required this.serviceShipping,required this.header,required this.fright,required this.service,required this.description,required this.imageService});
 final List <String> serviceShipping;
 final String description;
 final String imageService;
 final String service;
 final String header;
 final String fright;
  @override
  Widget build(BuildContext context) {
    return ConstantTopic(
      newScreen:SingleChildScrollView(
        child: Column(
          children: [
             TopScreenCustom(pageTwo: service, pageShow: fright,show: true),
            Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(imageService),
                    const SizedBox(
                      height: 25,
                    ),
                    const TextTitle(text: 'WHAT WE DO', fontSize: 23),
                    const SimpleAni(color2: ColorCustom.white),
                    Text(description),
                    const SizedBox(
                      height: 25,
                    ),
                    TextTitle(text: header, fontSize: 23),
                    const SimpleAni(color2:ColorCustom.white),
                    ListView.separated(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                        itemBuilder:(context, index) => Text(' -> ${serviceShipping[index]}'),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: serviceShipping.length),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
