import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/colorCustom.dart';

int active = 0;

List<EasyStep> buildEasySteps({int? step}) {
  active=step!;
  return [
    _buildStep('Booking', 0),
    _buildStep('Loading', 1, topTitle: true),
    _buildStep('Trucking', 2),
    _buildStep('Custom Clear', 3, topTitle: true),
    _buildStep('On Trip', 4),
    _buildStep('Done', 5, topTitle: true, isStar: true),
  ];
}

EasyStep _buildStep(String title, int index,
    {bool topTitle = false, bool isStar = false}) {
  return EasyStep(
    customStep: CircleAvatar(
      radius: 10,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 9,
        backgroundColor: active >= index ? ColorCustom.red : Colors.white,
        child: Icon(
          isStar ? Icons.star : Icons.done_outline,
          color: ColorCustom.white,
          size: isStar ? 13 : 12,
        ),
      ),
    ),
    title: title,
    topTitle: topTitle,
  );
}
