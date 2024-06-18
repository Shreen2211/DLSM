import 'package:dlsm/ViewModel/Bloc/FeedBackAndRate/feedback_and_rate_cubit.dart';
import 'package:dlsm/ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';
import 'package:dlsm/ViewModel/Data/Local/SharedKey.dart';
import 'package:dlsm/ViewModel/Data/Local/Shared_Preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Model/User/UserData.dart';
import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../../ViewModel/Utils/colorCustom.dart';
import '../../Component/Text/TitleCustom.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key, required this.dataUser});

  final User dataUser;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: dataUser.id == null
          ? const Center(
          child: CircularProgressIndicator(
            color: ColorCustom.red,
          ))
          : Scaffold(
        backgroundColor: ColorCustom.footColor,
        appBar: AppBar(
          backgroundColor: ColorCustom.footColor,
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize:
            Size.fromHeight(AppBar().preferredSize.height * 2.5),
            child: Container(
              margin: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                          radius: 50,
                          backgroundColor: ColorCustom.red,
                          child: Icon(
                            Icons.person,
                            color: ColorCustom.white,
                            size: 50,
                          )),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextTitle(
                                text: '${dataUser.name}',
                                fontSize: 25,
                                color: ColorCustom.white),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              dataUser.type ?? '',
                              style: const TextStyle(
                                  color: ColorCustom.gray, fontSize: 17),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextTitle(
                                    text: '3.4 ',
                                    color: ColorCustom.gray,
                                    fontSize: 18),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.amberAccent,
                                  size: 18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                      color: ColorCustom.red,
                    ),
                    tabs: const [
                      Tab(
                        child: Text(
                          'Reviews',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Info',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body:
        TabBarView(physics: const BouncingScrollPhysics(), children: [
          BlocConsumer<FeedbackAndRateCubit, FeedbackAndRateState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit=FeedbackAndRateCubit.get(context);
              return Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImgCustom.foot),
                        fit: BoxFit.cover,
                      )),
                  child: ListView.builder(
                      itemBuilder: (context, index) {
                        double rate = double.parse(cubit.totalFeedback[index].rate!);
                        return  Card(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: ColorCustom.red,
                                        child: Icon(
                                          Icons.person,
                                          color: ColorCustom.white,
                                          size: 25,
                                        )),
                                    TextTitle(
                                        text: '\t ${cubit.totalFeedback[index].client?.name}',
                                        fontSize: 18,
                                        color: ColorCustom.red),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '${cubit.totalFeedback[index].message}',
                                  style: const TextStyle(
                                      color: ColorCustom.white, fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 20,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Icon(
                                        index < rate ? Icons.star : Icons.star_border,
                                        color: Colors.amber,
                                      );
                                    },
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      itemCount: cubit.totalFeedback.length));
            },
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImgCustom.foot),
                    fit: BoxFit.cover,
                  )),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                                '${ReqAndOfferCubit
                                    .get(context)
                                    .myRequest
                                    .length}',
                                style: const TextStyle(
                                    color: ColorCustom.white,
                                    fontSize: 20)),
                            const Text('Request',
                                style: TextStyle(
                                    color: ColorCustom.white,
                                    fontSize: 20)),
                          ],
                        ),
                        const Column(
                          children: [
                            Text('0',
                                style: TextStyle(
                                    color: ColorCustom.white,
                                    fontSize: 20)),
                            Text('In process',
                                style: TextStyle(
                                    color: ColorCustom.white,
                                    fontSize: 20)),
                          ],
                        ),
                        const Column(
                          children: [
                            Text('2',
                                style: TextStyle(
                                    color: ColorCustom.white,
                                    fontSize: 20)),
                            Text('Done',
                                style: TextStyle(
                                    color: ColorCustom.white,
                                    fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.email,
                              color: ColorCustom.white,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text('${dataUser.email}',
                                style: const TextStyle(
                                    color: ColorCustom.white,
                                    fontSize: 20)),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone,
                              color: ColorCustom.white,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text('${dataUser.phoneNumber}',
                                style: const TextStyle(
                                    color: ColorCustom.white,
                                    fontSize: 20)),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Visibility(
                          visible: LocalData.get(
                              key: SharedKey.currentUserType) !=
                              '1' &&
                              LocalData.get(
                                  key: SharedKey.currentUserType) !=
                                  6,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_outlined,
                                    color: ColorCustom.white,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    child: Text('${dataUser.address}',
                                        style: const TextStyle(
                                            color: ColorCustom.white,
                                            fontSize: 20)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.web,
                                    color: ColorCustom.white,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    child: Text('${dataUser.website}',
                                        style: const TextStyle(
                                            color: ColorCustom.white,
                                            fontSize: 20)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: LocalData.get(
                              key: SharedKey.currentUserType) ==
                              '1',
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.language,
                                    color: ColorCustom.white,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text('${dataUser.nationality}',
                                      style: const TextStyle(
                                          color: ColorCustom.white,
                                          fontSize: 20)),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.perm_contact_cal_outlined,
                                    color: ColorCustom.white,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text('${dataUser.sSN}',
                                      style: const TextStyle(
                                          color: ColorCustom.white,
                                          fontSize: 20)),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: LocalData.get(
                              key: SharedKey.currentUserType) ==
                              '2' ||
                              LocalData.get(
                                  key: SharedKey.currentUserType) ==
                                  '3',
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.align_horizontal_right,
                                    color: ColorCustom.white,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    child: Text(
                                        '${dataUser.countryTarget}',
                                        style: const TextStyle(
                                            color: ColorCustom.white,
                                            fontSize: 20)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.swipe_right,
                                    color: ColorCustom.white,
                                    size: 30,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    child: Text(
                                        '{${dataUser.countryDealing}}',
                                        style: const TextStyle(
                                            color: ColorCustom.white,
                                            fontSize: 20)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        /*     Visibility(
                                visible: LocalData.get(
                                        key: SharedKey.currentUserType) ==
                                    4,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.history,
                                          color: ColorCustom.white,
                                          size: 30,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text('${dataUser.businessHistory}',
                                            style: const TextStyle(
                                                color: ColorCustom.white,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.alarm,
                                          color: ColorCustom.white,
                                          size: 30,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text('{${dataUser.businessHours}}',
                                            style: const TextStyle(
                                                color: ColorCustom.white,
                                                fontSize: 20)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),*/
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  /* Visibility(
                          visible: LocalData.get(key: SharedKey.currentUserType) == 6,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Data Company\'s Agent',
                                    style: TextStyle(
                                        color: ColorCustom.white,
                                        fontSize: 20)),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.business,
                                      color: ColorCustom.white,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(shippingUser!.name??'',
                                        style: const TextStyle(
                                            color: ColorCustom.white,
                                            fontSize: 20)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.email,
                                      color: ColorCustom.white,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(shippingUser!.email??'',
                                        style: const TextStyle(
                                            color: ColorCustom.white,
                                            fontSize: 20)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      color: ColorCustom.white,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(shippingUser!.phoneNumber??'',
                                        style: const TextStyle(
                                            color: ColorCustom.white,
                                            fontSize: 20)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: ColorCustom.white,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Text(shippingUser!.address??'',
                                          style: const TextStyle(
                                              color: ColorCustom.white,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.web,
                                      color: ColorCustom.white,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Flexible(
                                      child: Text(shippingUser!.website??'',
                                          style: const TextStyle(
                                              color: ColorCustom.white,
                                              fontSize: 20)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.history,
                                      color: ColorCustom.white,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(shippingUser!.businessHistory??'',
                                        style: const TextStyle(
                                            color: ColorCustom.white,
                                            fontSize: 20)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.alarm,
                                      color: ColorCustom.white,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text('{${shippingUser!.businessHours??''}}',
                                        style: const TextStyle(
                                            color: ColorCustom.white,
                                            fontSize: 20)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),*/
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
