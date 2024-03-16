import 'package:flutter/material.dart';

import '../models/guide_license_model.dart';
import '../models/verifiable_credential_model.dart';
import '../utils/dot_data_utils.dart';

class TouristGuideLicenseCard3 extends StatelessWidget {
  const TouristGuideLicenseCard3({
    super.key,
    required this.credential,
    this.press,
  });

  final VerifiableCredential credential;
  final VoidCallback? press;

  static const double defaultBorderRadius = 16.0;

  @override
  Widget build(BuildContext context) {
    //return buildCard(context, 300, 200);
    //return LayoutBuilder(BuildContext context, BoxConstraints constraints) {
    return GestureDetector(
      onTap: press,
      //child: Container(),
      child: Material(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          //side: const BorderSide(color: Colors.red, width: 1),
        ),
        child: buildCard(context, 300, 200),
      ),
    );
  }

  Widget buildCard(BuildContext context, double cardWidth, double cardHeight) {
    //final hight =
    const textStyle = TextStyle(fontFamily: 'Sarabun', color: Colors.black87);
    GuideLicense license = GuideLicense.fromJson(credential.attrs);
    final regionName = DotDataUtil.setRegionEn(license.regionId).toLowerCase();
    final cardImageSrc =
        'assets/images/dot/tourist-guide-license-$regionName.jpeg';
    return Container(
      width: cardWidth,
      height: cardHeight,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(cardImageSrc),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(1),
            BlendMode.dstATop,
          ),
        ),
      ),
    );
  }
}
