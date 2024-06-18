import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../ViewModel/Data/Local/SharedKey.dart';
import '../../ViewModel/Data/Local/Shared_Preferences.dart';
import '../../ViewModel/Utils/colorCustom.dart';

class ListNav {
  static List<BottomBarItem> buildBottomNavBarItems() {
    var type = LocalData.get(key: SharedKey.currentUserType);
    List<BottomBarItem> items = [
      const BottomBarItem(
        itemLabel: 'Request',
        inActiveItem: Icon(Icons.comment, color: Colors.white),
        activeItem: Icon(Icons.comment, color: ColorCustom.white),
      ),
      const BottomBarItem(
        itemLabel: 'Home',
        inActiveItem: Icon(Icons.home_filled, color: Colors.white),
        activeItem: Icon(Icons.home_filled, color: ColorCustom.white),
      ),
      const BottomBarItem(
        itemLabel: 'Profile',
        inActiveItem: Icon(Icons.person, color: Colors.white),
        activeItem: Icon(Icons.person, color: ColorCustom.white),
      ),
    ];

    if (type != 4 && type != 6) {
      items.insert(2,
        const BottomBarItem(
          itemLabel: "New Req",
          activeItem: Icon(Icons.create_new_folder_outlined, color: ColorCustom.white),
          inActiveItem: Icon(Icons.create_new_folder_outlined, color: Colors.white),
        ),
      );
    }

    return items;
  }
}
