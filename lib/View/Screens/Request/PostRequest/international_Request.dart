import 'package:flutter/material.dart';

import '../../../Component/CustomRequestScreen/TemplateRequestScreen.dart';

class International extends StatelessWidget {
  const International({super.key});

  @override
  Widget build(BuildContext context) {
    return const Request(
      pageShow: 'international',
      typeReq: '2',
    );
  }
} /*LocalData.get(key: SharedKey.currentUserID).toString());*/
