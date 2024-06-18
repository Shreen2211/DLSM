import 'package:flutter/material.dart';

import '../../Component/Background/AppBar.dart';
import '../../Component/TopScreen/TopScreenCustom.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConstantTopic(
        newScreen: SingleChildScrollView(
            child: Column(
                children: [
                TopScreenCustom(
                pageTwo: 'Edit Profile', pageShow: 'no thing', show: false),
            SizedBox(
              height: 15,
            ),
        ])
    )
    );
  }
}
