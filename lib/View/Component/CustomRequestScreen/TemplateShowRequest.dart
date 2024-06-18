import 'package:dlsm/View/Component/Constant/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Model/Request/RequestModel.dart';
import '../../../ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';
import '../../../ViewModel/Data/Local/SharedKey.dart';
import '../../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../../ViewModel/Utils/colorCustom.dart';
import '../../Component/Background/SignBackground.dart';
import '../../Component/Text/TitleCustom.dart';
import '../../Component/TopScreen/TopScreenCustom.dart';
import '../../Screens/Request/ShowRequest/RequestDetails.dart';
import '../TitleAnimation/TitleAnimation.dart';

class TemplateShowRequest extends StatelessWidget {
  const TemplateShowRequest({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReqAndOfferCubit, ReqAndOfferState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=ReqAndOfferCubit.get(context);
        List<RequestModel> listRequest=[];
        String? listUser;
        if(LocalData.get(key: SharedKey.currentUserType)==4||LocalData.get(key: SharedKey.currentUserType)==6){
          listRequest.addAll(cubit.allRequest);
          listUser='All Request';
        }else{
          listRequest.addAll(cubit.myRequest);
          listUser='My Request';
        }
        String? type;
        return SignBackground(
          backgroundPhoto: ImgCustom.imgLogin,
          newScreen: SingleChildScrollView(
            child: Column(
              children: [
                 TopScreenCustom(
                    pageTwo: listUser, pageShow: 'nothing', show: false),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const TextTitle(
                        text: ' Number of Request : ', fontSize: 25),
                    TextTitle(
                        text: '${listRequest.length}',
                        fontSize: 25,
                        color: ColorCustom.red),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        if (listRequest[index].typeOfRequest == '1') {
                          type = 'DHL';
                        } else if (listRequest[index].typeOfRequest == '2') {
                          type = 'International';
                        } else if (listRequest[index].typeOfRequest == '3') {
                          type = 'Local';
                        }
                        return Column(
                          children: [
                            Container(
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
                                    child: TitleAnimation(
                                      title:
                                          '${listRequest[index].client!.name}',
                                      color: ColorCustom.white,
                                      colorAni: ColorCustom.footColor,
                                      size: 22,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "From",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 22),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        " : ${listRequest[index].location} ",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 22),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "To    ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 22),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        "  : ${listRequest[index].locationTwo}  ",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 22),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "Commodity : ${listRequest[index].goodsType} ",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 22),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "$type",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 25),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            ReqAndOfferCubit.get(context)
                                                .getOffers(id: listRequest[index].id!);
                                            if (listRequest[index].accept ==
                                                1) {
                                              ReqAndOfferCubit.get(context)
                                                  .getSpecificOffers(
                                                      id: listRequest[index]
                                                          .acceptId!);
                                            }
                                            Navigation.push(
                                                context,
                                                RequestDetails(
                                                  type: type,
                                                    req: listRequest[index],
                                                    num: index));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(150, 50),
                                            backgroundColor: ColorCustom.red,
                                          ),
                                          child: LocalData.get(
                                                      key: SharedKey
                                                          .currentUserType) ==
                                                  6
                                              ?  Text(listRequest[index].accept==null?"Give an Offer":"Show Process")
                                              : const Text("Show Request")),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listRequest.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
