import 'package:flutter/material.dart';

import '../../../Component/CustomRequestScreen/TemplateRequestScreen.dart';


class LocalRequest extends StatelessWidget {
  const LocalRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return const Request(pageShow: 'Local',typeReq:'3',);
  }
}
/*LocalData.get(key: SharedKey.currentUserID).toString());*/