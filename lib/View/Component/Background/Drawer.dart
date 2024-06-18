import 'package:dlsm/ViewModel/Bloc/AuthCubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import '../../../Model/DrawerList/DrawerList.dart';
import '../../../ViewModel/Bloc/AgentCubit/agent_cubit.dart';
import '../../../ViewModel/Data/Local/SharedKey.dart';
import '../../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../../ViewModel/Utils/colorCustom.dart';
import '../../Screens/Agent/Agent.dart';
import '../Constant/Navigation.dart';
import '../Text/TitleCustom.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
      ),
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImgCustom.footer1),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 27,
                  backgroundColor: ColorCustom.red,
                  child: Icon(
                    Icons.person,
                    color: ColorCustom.white,
                    size: 40,
                  ),
                ),
                TextTitle(
                  text: '\t ${AuthCubit.get(context).dataUser.name??' My Name '}',
                  fontSize: 22,
                  color: ColorCustom.white,
                ),
              ],
            ),
          ),
          Visibility(
            visible: LocalData.get(key: SharedKey.currentUserType) == 4,
            child: ListTile(
              leading: const Icon(
                Icons.people_alt_outlined,
                size: 35,
              ),
              title: const Text(
                'My Agent',
                style: TextStyle(fontSize: 19),
              ),
              onTap: () {
                AgentCubit.get(context)
                    .getDate(currentUserID: LocalData.get(key: SharedKey.currentUserID));
                Navigation.push(context, const Agent());
              },
            ),
          ),
          ListView.builder(
            shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
             itemBuilder: (context, index) {
               return ListTile(
                 leading:  Icon(
                   DrawerList.drawer(context)[index]['icon'],
                   size: 35,
                 ),
                 title:  Text(
                   DrawerList.drawer(context)[index]['title'],
                   style: const TextStyle(fontSize: 19),
                 ),
                 onTap: DrawerList.drawer(context)[index]['onTap'],
               );
             },
            itemCount: DrawerList.drawer(context).length,
            padding: const EdgeInsets.all(0),

          ),
        ],
      ),
    );
  }
}
/*children: [


              ListTile(
                leading: const Icon(
                  Icons.home,
                  size: 35,
                ),
                title: const Text(
                  ' Home ',
                  style: TextStyle(fontSize: 19),
                ),
                onTap: () {
                  Navigation.push(context, const MyHomePage());
                },
              ),

              ListTile(
                leading: const Icon(
                  Icons.edit,
                  size: 35,
                ),
                title: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 19),
                ),
                onTap: () {
                  Navigation.push(context, const EditProfile());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.interests,
                  size: 35,
                ),
                title: const Text(
                  'Our Service',
                  style: TextStyle(fontSize: 19),
                ),
                onTap: () {
                  Navigation.push(context, ChooseService());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.info_outline_rounded,
                  size: 35,
                ),
                title: const Text(
                  'About Us',
                  style: TextStyle(fontSize: 19),
                ),
                onTap: () {
                  Navigation.push(context, const AboutUs());
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: ColorCustom.red,
                  size: 35,
                ),
                title: const Text(
                  'LogOut',
                  style: TextStyle(fontSize: 19, color: ColorCustom.red),
                ),
                onTap: () {
                  {
                    ShowDialog(
                        title: 'LogOut',
                        message: 'Are you sure you need logOut your account?',
                        context: context,
                        onPressedAccept: () {
                          Navigation.push(context, LoginScreen());
                          LocalData.clear();
                        }).alert();
                  }
                },
              ),
            ],*/