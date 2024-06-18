import 'package:dlsm/View/Component/Button/ButtonCustom.dart';
import 'package:dlsm/View/Component/Text/TitleCustom.dart';
import 'package:dlsm/View/Component/TitleAnimation/TitleAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Model/Request/RequestModel.dart';
import '../../../ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';
import '../../../ViewModel/Utils/colorCustom.dart';
import '../../Component/Shape/ShapeCustom.dart';

class ShowOffers extends StatelessWidget {
  const ShowOffers({super.key, required this.req});

  final RequestModel req;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReqAndOfferCubit, ReqAndOfferState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ReqAndOfferCubit.get(context);
        return Column(
          children: [
            const TitleAnimation(title: 'Offers This Request'),
            Visibility(
              replacement: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 10,
                        blurRadius: 5,
                        offset:
                            const Offset(3, 3), // Offset in x and y direction
                      ),
                    ],
                    color: const Color(0xff0f1B24),
                    borderRadius: BorderRadiusDirectional.circular(15),
                    image: const DecorationImage(
                      opacity: 0.1,
                      image: AssetImage(
                          'assets/image/Background/pricing-one-shape-1-1.png'),
                      fit: BoxFit.cover,
                    )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Center(
                            child: Column(
                              children: [
                                Text(
                                 ' ${cubit.offerSpecific.agent?.agentCompany?.name} ',
                                  style: const TextStyle(
                                      color: ColorCustom.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'From ${cubit.offerSpecific.agent?.agentCompany?.businessHistory}',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      height: 1.7,
                                      fontSize: 16),
                                ),
                              ],
                            )),
                      SizedBox(height: 10,),
                      const Center(child: Shape()),
                      Text(
                        "From : ${cubit.offerSpecific.from} ",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "To : ${cubit.offerSpecific.tO}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "T.T : ${cubit.offerSpecific.tT}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Price : ${cubit.offerSpecific.price} \$",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                cubit.changeMore(-1);
                              },
                              icon: cubit.offerSpecific.more == true
                                  ? const Icon(
                                      Icons.arrow_circle_up,
                                      color: ColorCustom.red,
                                      size: 35,
                                    )
                                  : const Icon(Icons.arrow_circle_down,
                                      color: ColorCustom.green, size: 35)),
                        ],
                      ),
                      Visibility(
                        visible: cubit.offerSpecific.more,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: cubit.offerSpecific.oF != null,
                              child: Column(
                                children: [
                                  Text(
                                    "OF : ${cubit.offerSpecific.oF} \$",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 25),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: cubit.offerSpecific.tHC != null,
                              child: Column(
                                children: [
                                  Text(
                                    "THC : ${cubit.offerSpecific.tHC} \$ ",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 25),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: cubit.offerSpecific.powerPerDay != '0',
                              child: Column(
                                children: [
                                  Text(
                                    "P/D : ${cubit.offerSpecific.powerPerDay} \$",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 25),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: cubit.offerSpecific.pL != '0',
                              child: Column(
                                children: [
                                  Text(
                                    "BL : ${cubit.offerSpecific.pL} \$ ",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 25),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: cubit.offerSpecific.extraFees != 0,
                              child: Column(
                                children: [
                                  Text(
                                    "ExtraFees : ${cubit.offerSpecific.extraFees}\$ ",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 25),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: cubit.offerSpecific.fT != '0',
                              child: Column(
                                children: [
                                  Text(
                                    "F.T: ${cubit.offerSpecific.fT} ",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 25),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              visible: req.accept == null,
              child: cubit.requestOffer.isEmpty
                  ? const Center(
                      child: TextTitle(
                      text: 'No Offers',
                    ))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 10,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      3, 3), // Offset in x and y direction
                                ),
                              ],
                              color: const Color(0xff0f1B24),
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                              image: const DecorationImage(
                                opacity: 0.1,
                                image: AssetImage(
                                    'assets/image/Background/pricing-one-shape-1-1.png'),
                                fit: BoxFit.cover,
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Text(
                                    ' ${cubit.requestOffer[index].agent?.agentCompany?.name} ',
                                    style: const TextStyle(
                                        color: ColorCustom.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                    textAlign: TextAlign.center,
                                  )),
                              const Center(child: Shape()),
                              Text(
                                "From : ${cubit.requestOffer[index].from} ",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "To : ${cubit.requestOffer[index].tO}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "T.T : ${cubit.requestOffer[index].tT}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Price : ${cubit.requestOffer[index].price} \$",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 25),
                                        textAlign: TextAlign.start,
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        cubit.changeMore(index);
                                      },
                                      icon: cubit.requestOffer[index].more ==
                                              true
                                          ? const Icon(
                                              Icons.arrow_circle_up,
                                              color: ColorCustom.red,
                                              size: 35,
                                            )
                                          : const Icon(Icons.arrow_circle_down,
                                              color: ColorCustom.green,
                                              size: 35)),
                                ],
                              ),
                              Visibility(
                                visible: cubit.requestOffer[index].more,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Visibility(
                                      visible:
                                          cubit.requestOffer[index].oF != null,
                                      child: Column(
                                        children: [
                                          Text(
                                            "OF : ${cubit.requestOffer[index].oF} \$",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                          cubit.requestOffer[index].tHC != null,
                                      child: Column(
                                        children: [
                                          Text(
                                            "THC : ${cubit.requestOffer[index].tHC} \$ ",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: cubit.requestOffer[index]
                                              .powerPerDay !=
                                          '0',
                                      child: Column(
                                        children: [
                                          Text(
                                            "P/D : ${cubit.requestOffer[index].powerPerDay} \$",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                          cubit.requestOffer[index].pL != '0',
                                      child: Column(
                                        children: [
                                          Text(
                                            "BL : ${cubit.requestOffer[index].pL} \$ ",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                          cubit.requestOffer[index].extraFees !=
                                              0,
                                      child: Column(
                                        children: [
                                          Text(
                                            "ExtraFees : ${cubit.requestOffer[index].extraFees}\$ ",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible:
                                          cubit.requestOffer[index].fT != '0',
                                      child: Column(
                                        children: [
                                          Text(
                                            "F.T: ${cubit.requestOffer[index].fT} ",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                    /*  Visibility(
                                        visible:
                                            cubit.requestOffer[index].comment !=
                                                null,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Comment : ${cubit.requestOffer[index].comment} ",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                              textAlign: TextAlign.start,
                                            ),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                          ],
                                        ),
                                      ),*/
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ButtonCustom(
                                      text: 'Reject',
                                      onPressed: () {},
                                      backGround: ColorCustom.red,
                                      width: 150,
                                      height: 50),
                                  ButtonCustom(
                                      text: 'Accept',
                                      onPressed: () {
                                        cubit.offerAccept(
                                            idReq: req.id,
                                            idOffer:
                                                cubit.requestOffer[index].id);
                                      },
                                      backGround: ColorCustom.green,
                                      width: 150,
                                      height: 50),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: cubit.requestOffer.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        );
      },
    );
  }
}
