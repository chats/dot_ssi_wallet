import 'package:flutter/material.dart';

import '../models/guide_license_model.dart';
import '../models/verifiable_credential_model.dart';
import '../utils/dot_data_utils.dart';

class ExamCertCard2 extends StatelessWidget {
  const ExamCertCard2({
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
    const textStyle = TextStyle(fontFamily: 'Sarabun', color: Colors.black87);
    //GuideLicense license = GuideLicense.fromJson(credential.attrs);
    //final regionName = DotDataUtil.setRegionEn(license.regionId).toLowerCase();
    final cardImageSrc = 'assets/images/dot/dot-logo-license.png';
    return Container(
      width: cardWidth,
      height: cardHeight,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(cardImageSrc),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Color.fromARGB(255, 224, 86, 0).withOpacity(0.2),
            BlendMode.dstATop,
          ),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          //colors: [Color(0xFFFAFAFA), Color(0xFFF0F0F0)],
          colors: [
            Color.fromARGB(255, 224, 86, 0),
            Color.fromARGB(255, 254, 135, 61)
          ],
        ),
      ),
    );
  }
}
