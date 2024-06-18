import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../Component/Service/ServiceComponent.dart';

class RoadService extends StatelessWidget {
  const RoadService({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> roadShipping = [
      'Straight Trucks',
      'Flatbeds',
      'Dry Vans',
      'Step Decks',
      'Roller Beds',
      'Curtain Vans',
      'Refrigerated',
    ];
    return ServiceComponent(
      header: 'TRUCKLOAD SERVICES',
      serviceShipping: roadShipping,
      description:
          'Road Freight is the physical process of transporting cargo by road using motor vehicles. In this case, road is a lane/route between the point of departure and the point of destination. Compared to other types of transport system such as sea and air, the cost of maintaining roads is cheaper.\n sometimes land freight is faster and cheaper and sometimes it is more expensive',
      fright: 'Road Fright',
      imageService: ImgCustom.roadService,
      service: 'Service',
    );
  }
}
