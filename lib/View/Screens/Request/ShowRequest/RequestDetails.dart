import 'package:dlsm/View/Component/Constant/Navigation.dart';
import 'package:dlsm/View/Screens/Offer/ShowOffers.dart';
import 'package:dlsm/View/Screens/Process/Process.dart';
import 'package:dlsm/ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../Model/Request/RequestModel.dart';
import '../../../../ViewModel/Bloc/FeedBackAndRate/feedback_and_rate_cubit.dart';
import '../../../../ViewModel/Data/Local/SharedKey.dart';
import '../../../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../../../../ViewModel/Utils/colorCustom.dart';
import '../../../Component/Background/AppBar.dart';
import '../../../Component/Button/ButtonCustom.dart';
import '../../../Component/TopScreen/TopScreenCustom.dart';
import '../../../Component/animation/simpleAnimation.dart';
import '../../Offer/AddOffer.dart';

class RequestDetails extends StatelessWidget {
  const RequestDetails(
      {super.key, required this.req, required this.num, this.type});

  final int? num;
  final RequestModel req;
  final String? type;

  @override
  Widget build(BuildContext context) {
    String? shippingType;
    if (req.typeOfInternational == '1') {
      shippingType = 'Road Freight';
    } else if (req.typeOfInternational == '2') {
      shippingType = 'Ocean Freight';
    } else if (req.typeOfInternational == '3') {
      shippingType = 'Air Freight';
    }
    return ConstantTopic(
      newScreen: SingleChildScrollView(
        child: Column(
          children: [
            TopScreenCustom(
                pageTwo: 'All Request', pageShow: 'No.${num! + 1}', show: true),
            const SizedBox(
              height: 15,
            ),
            ButtonCustom(
                text: 'Process',
                width: 150,
                onPressed: () {
                  if (req.accept == 1 &&
                      (ReqAndOfferCubit.get(context).offerSpecific.agent?.id ==
                              LocalData.get(key: SharedKey.currentUserID) ||
                          req.client?.id ==
                              LocalData.get(key: SharedKey.currentUserID))) {
                    Navigation.push(
                        context,
                        Process(
                          listRequest: req,
                          type: type,
                          shipper: ReqAndOfferCubit.get(context)
                              .offerSpecific
                              .agent!,
                        ));
                    FeedbackAndRateCubit.get(context).current(idReq: req.id);
                  }
                },
                backGround: req.accept == 1 &&
                        (ReqAndOfferCubit.get(context)
                                    .offerSpecific
                                    .agent
                                    ?.id ==
                                LocalData.get(key: SharedKey.currentUserID) ||
                            req.client?.id ==
                                LocalData.get(key: SharedKey.currentUserID))
                    ? ColorCustom.red
                    : Colors.grey),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      // Shadow color
                      spreadRadius: 10,
                      // Spread radius
                      blurRadius: 5,
                      // Blur radius
                      offset: const Offset(3, 3), // Offset in x and y direction
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
                      child: Text(
                    '${req.client?.name}',
                    style: const TextStyle(
                        color: ColorCustom.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
                  const Center(
                      child: SimpleAni(
                    color2: ColorCustom.footColor,
                  )),
                  Visibility(
                    visible: req.country != null,
                    child: Column(
                      children: [
                        Text(
                          "Country : ${req.country} ",
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
                    visible: req.destination != null,
                    child: Column(
                      children: [
                        Text(
                          "From : ${req.destination} ",
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
                    visible: req.destinationTwo != null,
                    child: Column(
                      children: [
                        Text(
                          "To : ${req.destinationTwo} ",
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
                    visible: req.goodsType != null,
                    child: Column(
                      children: [
                        Text(
                          "Commodity : ${req.goodsType} ",
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
                    visible: req.weight != null,
                    child: Column(
                      children: [
                        Text(
                          "Weight : ${req.weight} ",
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
                    visible: req.height != null,
                    child: Column(
                      children: [
                        Text(
                          "Height : ${req.height} ",
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
                    visible: req.length != null,
                    child: Column(
                      children: [
                        Text(
                          "Length : ${req.length} ",
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
                    visible: req.width != null,
                    child: Column(
                      children: [
                        Text(
                          "Width : ${req.width} ",
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
                    visible: req.safety != null,
                    child: Column(
                      children: [
                        Text(
                          "Safety : ${req.safety} ",
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
                    visible: req.containerTypeAndSize != null,
                    child: Column(
                      children: [
                        Text(
                          "Container Type: ${req.containerTypeAndSize} ",
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
                    visible: req.numberOfContainer != null,
                    child: Column(
                      children: [
                        Text(
                          "No. Container: ${req.numberOfContainer} ",
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
                    visible: req.typesOfTruck != null,
                    child: Column(
                      children: [
                        Text(
                          "Type Truck: ${req.typesOfTruck} ",
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
                    visible: req.numberOfCartons != null,
                    child: Column(
                      children: [
                        Text(
                          "No. Cartons: ${req.numberOfCartons} ",
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
                    visible: req.weightOfSingleCarton != null,
                    child: Column(
                      children: [
                        Text(
                          "Weight Single Cartons: ${req.weightOfSingleCarton} ",
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
                    visible: req.comment != null,
                    child: Column(
                      children: [
                        Text(
                          "Comment : ${req.comment} ",
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
                    visible: req.customClearance != null,
                    child: const Column(
                      children: [
                        Text(
                          "Custom Clearance : Yes ",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: req.tracking != null,
                    child: const Column(
                      children: [
                        Text(
                          "Tracking : Yes ",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: req.typeOfInternational != null,
                    child: Column(
                      children: [
                        Text(
                          "Shipment : $shippingType ",
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
            Visibility(
                visible: LocalData.get(key: SharedKey.currentUserType) == 6 &&
                    req.accept == null,
                child: AddOffer(
                  req: req,
                )),
            Visibility(
                visible: LocalData.get(key: SharedKey.currentUserType) != 6 &&
                    LocalData.get(key: SharedKey.currentUserType) != 4,
                child: ShowOffers(
                  req: req,
                )),
          ],
        ),
      ),
    );
  }
}
