import 'package:flutter/material.dart';

import '../../../Component/CustomRequestScreen/TemplateRequestScreen.dart';

class DHL extends StatelessWidget {
  const DHL({super.key});

  @override
  Widget build(BuildContext context) {
    return const Request(
      pageShow: 'DHL',
      typeReq: '1',
    );
  }
} /*LocalData.get(key: SharedKey.currentUserID).toString());*/
