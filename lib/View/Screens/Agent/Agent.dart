import 'package:dlsm/View/Component/Text/TitleCustom.dart';
import 'package:dlsm/View/Component/TitleAnimation/TitleAnimation.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ViewModel/Bloc/AgentCubit/agent_cubit.dart';
import '../../../ViewModel/Data/Local/SharedKey.dart';
import '../../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../../../ViewModel/Utils/colorCustom.dart';

import '../../../i10l/locale_keys.g.dart';
import '../../Component/Background/AppBar.dart';
import '../../Component/Button/ButtonCustom.dart';
import '../../Component/Input/InputCustom.dart';

class Agent extends StatelessWidget {
  const Agent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocConsumer<AgentCubit, AgentState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AgentCubit.get(context);
          return ConstantTopic(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height*1.4),
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                    color: Colors.grey,
                  ),
                  child: TabBar(
                    physics: const AlwaysScrollableScrollPhysics(),
                    labelColor: Colors.white,
                    unselectedLabelColor: ColorCustom.footColor,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                      color: ColorCustom.red,
                    ),
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.person_outline_outlined),
                        text: 'All Agent',
                      ),
                      Tab(
                        icon: Icon(Icons.people_alt_outlined),
                        text: 'Add Agent',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            newScreen: Container(
              padding: const EdgeInsets.all(10),
              child:
                  TabBarView(physics: const BouncingScrollPhysics(), children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(onPressed: (){
                          AgentCubit.get(context).getDate(
                              currentUserID: LocalData.get(key: SharedKey.currentUserID));
                        }, icon: const Icon(Icons.refresh)),
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return DottedBorder(
                              strokeWidth: 1,
                              color:  Colors.black,
                              dashPattern: const [3, 2],
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      cubit.showData(index);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(double.infinity, 55),
                                      backgroundColor: Colors.white,
                                    ),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextTitle(color: ColorCustom.red,
                                              text: cubit.dataAgent[index].name!,
                                              fontSize: 22),
                                          const Icon(color: ColorCustom.red,
                                              Icons.arrow_forward_ios_outlined),
                                        ]),
                                  ),
                                  Visibility(
                                      visible: cubit.dataAgent[index].isShow,
                                      child: Container(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextTitle(
                                                text: cubit.dataAgent[index].email!,
                                                fontSize: 20,
                                                color: Colors.white),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextTitle(
                                                text: cubit.dataAgent[index].phone!,
                                                fontSize: 20,
                                                color: Colors.white),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Align(
                                                alignment: Alignment.bottomRight,
                                                child: InkWell(
                                                    onTap: () {
                                                      cubit.agentDelete(currentUserID: LocalData.get(key: SharedKey.currentUserID),agentID: cubit.dataAgent[index].id);
                                                    },
                                                    child: const Icon(
                                                      Icons.delete_forever,
                                                      color: ColorCustom.red,
                                                      size: 40,
                                                    )))
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 15,
                              ),
                          itemCount: cubit.dataAgent.length),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const TitleAnimation(title: 'New Agent'),
                        InputCustom(
                            controller: cubit.nameController,
                            inputName: LocaleKeys.name.tr(),
                            keyboardType: TextInputType.name),
                        InputCustom(
                            controller: cubit.emailController,
                            inputName: LocaleKeys.email.tr(),
                            keyboardType: TextInputType.emailAddress),
                        InputCustom(
                            controller: cubit.passwordController,
                            obscureText: true,
                            inputName: LocaleKeys.password.tr(),
                            keyboardType: TextInputType.visiblePassword),
                        InputCustom(
                            controller: cubit.passwordConfirmController,
                            obscureText: true,
                            inputName: LocaleKeys.confirmPassword.tr(),
                            keyboardType: TextInputType.visiblePassword),
                        InputCustom(
                            controller: cubit.phoneNumberController,
                            inputName: LocaleKeys.phoneNumber.tr(),
                            keyboardType: TextInputType.phone),
                        ButtonCustom(
                            text: 'Add',
                            onPressed: () {
                              cubit.addAgent(LocalData.get(key: SharedKey.currentUserID));
                            })
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
