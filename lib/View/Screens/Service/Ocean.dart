import 'package:flutter/material.dart';

import '../../../ViewModel/Utils/Img_Custom.dart';
import '../../Component/Service/ServiceComponent.dart';


class OceanService extends StatelessWidget {
  const OceanService({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> oceanShipping = [
      'Door to door',
      'Door to port',
      'Full containers (FCL shipping)',
      'Less than container load shipments (LCL)',
      'General sea cargo shipping',
      'Specialized items',
      'Over dimensional loads',
      'Heavy equipment',
      'Hazardous materials (hazmat)',
      'High-value cargo',
      'Cargo insurance',
      'Customs clearance',
      'Documentation',
      'Freight consolidation',
      'Warehousing and storage',
    ];
    return ServiceComponent(header: 'OCEAN SERVICES',
      serviceShipping: oceanShipping,
      description:
          'Provide both Full Container Load (FCL) and Less than Container Load (LCL) services for your shipments, as well as out-of-gauge and break bulk services for your non-containerized cargo.FCL (Full-Container-Load) Based on carrier routing options, FCL is our best transit-time-to-cost combination product for full container loads. FCL offers complete schedule flexibility, a highfrequency of sailings per port-pair, and availability of equipment.LCL (Less than-Container-Load) \n A competitively priced consolidation product, LCL offers the highest levels of schedule integrity.\n Sea freight service options.\n Full container load. 20ft or 40ft container shipping \n LCL, Less than a container load. 20ft or 40ft container shipping.',
      fright: 'Ocean Fright',
      imageService: ImgCustom.oceanService,
      service: 'Service',
    );
  }
}
