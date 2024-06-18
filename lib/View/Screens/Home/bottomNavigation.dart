import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:dlsm/Model/bottomNavList/ListNav.dart';
import 'package:dlsm/ViewModel/Bloc/AuthCubit/auth_cubit.dart';
import 'package:dlsm/ViewModel/Bloc/FeedBackAndRate/feedback_and_rate_cubit.dart';
import 'package:dlsm/ViewModel/Bloc/Post/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ViewModel/Bloc/ReqAndOffer/req_and_offer_cubit.dart';
import '../../../ViewModel/Data/Local/SharedKey.dart';
import '../../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../../ViewModel/Utils/colorCustom.dart';
import '../../Component/Background/Drawer.dart';
import '../../Component/Constant/Navigation.dart';
import '../../Component/CustomRequestScreen/TemplateShowRequest.dart';
import '../Profile/Profile.dart';
import '../Request/PostRequest/ChooseNewReq.dart';
import 'Search.dart';
import 'TimeLine.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pageController = PageController(initialPage: 1);
  final _controller = NotchBottomBarController(index: 1);
  int maxCount = 4;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int? id = LocalData.get(key: SharedKey.currentUserID);
    var type = LocalData.get(key: SharedKey.currentUserType);
    AuthCubit.get(context).getDate(type: type, id: id);
    PostCubit.get(context).getPosts(id: id);
    ReqAndOfferCubit.get(context).getRequest(id: id);
    if(type==4){
      FeedbackAndRateCubit.get(context).getShippingFeedback(idShipping: id);
    }
    List<Widget> bottomBarPages = [
      const TemplateShowRequest(),
      const TimeLine(),
      if (type != 4 && type != 6) const ChooseRequest(),
      BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return UserProfile(dataUser: AuthCubit.get(context).dataUser);
  },
),
    ];
     return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        title: Image.asset(ImgCustom.imgLogo, height: 60),
        backgroundColor: ColorCustom.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigation.push(context, const ShippingCompanyScreen());
            },
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          )
        ],
      ),
      drawer: const DrawerCustom(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: ColorCustom.footColor,
        showLabel: true,
        notchColor: ColorCustom.red,
        bottomBarWidth: 500,
        itemLabelStyle: const TextStyle(color: ColorCustom.white),
        durationInMilliSeconds: 300,
        bottomBarItems:ListNav.buildBottomNavBarItems(),
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
