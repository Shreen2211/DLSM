import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../Component/Service/ServiceComponent.dart';
class AirService extends StatelessWidget {
  const AirService({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> airShipping = [
      ' Consolidated air freight services',
      'Airport to airport',
      'Door to door',
      'Dangerous goods',
      'Government regulations',
      'Customs clearance and requirements',
      'Proper documentation',
      'Security initiatives and stringent compliance guidelines',
    ];
    return ServiceComponent(
      header: 'AIR SERVICES',
      serviceShipping: airShipping,
      description:
          'Direct Contact with all airlines, therefore is able to offer competitive rates with a reliable airfreight service worldwide, With over 20 Carrier, able to offer export/import services to/from all over the world. This makes it possible to work with the time frames that our customers require, with nearly daily freighter connections to main and transit airports, shipments with larger dimensions and weights can be handled easily',
      fright: 'Air Fright',
      imageService: ImgCustom.airService,
      service: 'Service',
    );
  }
}
