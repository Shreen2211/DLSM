import 'package:dlsm/Model/MyAgent/ShowDataAgent.dart';
import 'package:dlsm/View/Component/Text/TitleCustom.dart';
import 'package:dlsm/View/Component/TitleAnimation/TitleAnimation.dart';
import 'package:dlsm/ViewModel/Bloc/FeedBackAndRate/feedback_and_rate_cubit.dart';
import 'package:dlsm/ViewModel/Data/Local/SharedKey.dart';
import 'package:dlsm/ViewModel/Data/Local/Shared_Preferences.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Model/Request/RequestModel.dart';
import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../../ViewModel/Utils/colorCustom.dart';
import '../../Component/Background/AppBar.dart';
import '../../Component/EasyStepper/EasySteper.dart';
import '../../Component/GiveFeedback/GiveFeedback.dart';
import '../../Component/Shape/TransShape.dart';
import '../../Component/TopScreen/TopScreenCustom.dart';
import '../../Component/animation/simpleAnimation.dart';

class Process extends StatelessWidget {
  const Process(
      {super.key, required this.listRequest, this.type, required this.shipper});

  final RequestModel listRequest;
  final MyAgentData shipper;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedbackAndRateCubit, FeedbackAndRateState>(
        listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      var cubit = FeedbackAndRateCubit.get(context);
      return ConstantTopic(
        newScreen: SingleChildScrollView(
          child: Column(
            children: [
              const TopScreenCustom(
                  pageTwo: 'Tracking', pageShow: 'nothing', show: false),
              Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextTitle(text: listRequest.destination!),
                        Image.asset(ImgCustom.iconRoad),
                        //Icon(Icons.local_shipping_outlined,color: ColorCustom.red,),
                        TextTitle(text: listRequest.destinationTwo!),
                      ],
                    ),
                    const SimpleAni(
                      color2: ColorCustom.white,
                    ),
                    Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: ColorCustom.layerPink,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      clipBehavior: Clip.none,
                      child: EasyStepper(
                        activeStep: cubit.activeStep,
                        lineStyle: const LineStyle(
                          lineLength: 40,
                          lineSpace: 0,
                          lineType: LineType.dotted,
                          defaultLineColor: Colors.white,
                          finishedLineColor: ColorCustom.red,
                          lineThickness: 2,
                        ),
                        activeStepTextColor: Colors.black87,
                        finishedStepTextColor: Colors.black87,
                        internalPadding: 0,
                        showLoadingAnimation: cubit.activeStep <= 4,
                        stepRadius: 12,
                        showStepBorder: false,
                        steps: buildEasySteps(step: cubit.activeStep),
                        onStepReached: (index) {
                          if (LocalData.get(key: SharedKey.currentUserType) ==
                              6) {
                            cubit.process(idReq: listRequest.id, num: index);
                          }
                        },
                      ),
                    ),
                    const TransformShape(),
                    Visibility(
                      visible: cubit.activeStep >= 5,
                      child: GiveFeedback(
                          rate: cubit.rate,
                          controller: cubit.commentController,
                          idClient: listRequest.client!.id,
                          idShipper: shipper.id),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 60),
                      decoration: const BoxDecoration(
                        color: Color(0xffFEF8F8),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          const TitleAnimation(
                              title: 'Shipper info',
                              fontWeight: FontWeight.bold),
                          Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                              radius: 27,
                                              backgroundColor: ColorCustom.red,
                                              child: Icon(
                                                Icons.person,
                                                color: ColorCustom.white,
                                                size: 40,
                                              )),
                                          Column(
                                            children: [
                                              TextTitle(
                                                  text:
                                                      '\t${shipper.agentCompany?.name}',
                                                  fontSize: 20,
                                                  color: ColorCustom.black),
                                              Text(
                                                'from ${shipper.agentCompany?.businessHistory}',
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    height: 1.7,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.phone,
                                            color: ColorCustom.red,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                              '${shipper.agentCompany?.phoneNumber}',
                                              style: const TextStyle(
                                                  color: ColorCustom.black,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.email,
                                            color: ColorCustom.red,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Flexible(
                                            child: Text(
                                                '${shipper.agentCompany?.email}',
                                                style: const TextStyle(
                                                    color: ColorCustom.black,
                                                    fontSize: 20)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            color: ColorCustom.red,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Flexible(
                                            child: Text(
                                                'Agent : ${shipper.name}',
                                                style: const TextStyle(
                                                    color: ColorCustom.black,
                                                    fontSize: 20)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const TransformShape(),
                          const TitleAnimation(
                              title: 'Client info',
                              fontWeight: FontWeight.bold),
                          Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                              radius: 27,
                                              backgroundColor: ColorCustom.red,
                                              child: Icon(
                                                Icons.person,
                                                color: ColorCustom.white,
                                                size: 40,
                                              )),
                                          TextTitle(
                                              text:
                                                  '\t${listRequest.client?.name}',
                                              fontSize: 20,
                                              color: ColorCustom.black),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.phone,
                                            color: ColorCustom.red,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                              '${listRequest.client?.phoneNumber}',
                                              style: const TextStyle(
                                                  color: ColorCustom.black,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.email,
                                            color: ColorCustom.red,
                                            size: 30,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Flexible(
                                            child: Text(
                                                '${listRequest.client?.email}',
                                                style: const TextStyle(
                                                    color: ColorCustom.black,
                                                    fontSize: 20)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const TransformShape(),
                          const TitleAnimation(
                            title: 'Shipment info',
                            fontWeight: FontWeight.bold,
                          ),
                          Card(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(28.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text('Product :',
                                              style: TextStyle(
                                                  color: ColorCustom.red,
                                                  fontSize: 20)),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Flexible(
                                            child: Text(
                                                '${listRequest.goodsType}',
                                                style: const TextStyle(
                                                    color: ColorCustom.black,
                                                    fontSize: 20)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Carrier :',
                                              style: TextStyle(
                                                  color: ColorCustom.red,
                                                  fontSize: 20)),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text('$type',
                                              style: const TextStyle(
                                                  color: ColorCustom.black,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          Text('Type :',
                                              style: TextStyle(
                                                  color: ColorCustom.red,
                                                  fontSize: 20)),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text('Ocean Freight',
                                              style: TextStyle(
                                                  color: ColorCustom.black,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Weight :',
                                              style: TextStyle(
                                                  color: ColorCustom.red,
                                                  fontSize: 20)),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text('${listRequest.weight}',
                                              style: const TextStyle(
                                                  color: ColorCustom.black,
                                                  fontSize: 20)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}