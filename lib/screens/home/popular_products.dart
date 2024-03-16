import 'package:dot_ssi_wallet/data/sample_card_data.dart';
import 'package:dot_ssi_wallet/widgets/tourist_guide_license_card3.dart';
import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          TouristGuideLicenseCard3(credential: sampleCardData[0], press: () {}),
    );
  }
}
