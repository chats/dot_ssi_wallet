import 'dart:ui';

import 'package:dot_ssi_wallet/models/guide_license_model.dart';
import 'package:dot_ssi_wallet/services/core/credential_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../models/verifiable_credential_model.dart';
import '../utils/datetime_utils.dart';
import '../utils/dot_data_utils.dart';

class TouristGuideLicenseCard2 extends StatelessWidget {
  const TouristGuideLicenseCard2({
    super.key,
    required this.press,
    required this.credential,
  });
  final VerifiableCredential credential;
  final VoidCallback press;

  static const double cardSizeRatio = 1.58577250834;
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('th_TH', null);

    //double cardHeight = 154.0;
    //double cardWidth = cardHeight * cardSizeRatio;

    //if (width! > 0.00) {
    //  cardWidth = width!;
    //  cardHeight = width! / cardSizeRatio;
    // }

    //print('width=${double.maxFinite}');
    //double cardWidth = double.maxFinite.roundToDouble();
    //double cardHeight = cardWidth / cardSizeRatio;
    //print('cardwidth=${cardWidth}');
    //print('cardheight=${cardHeight}');
    return GestureDetector(
      onTap: press,
      child: Material(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          //side: const BorderSide(color: Colors.red, width: 1),
        ),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          //return Container(width: c,);
          return _buildCard(context, constraints.maxWidth,
              constraints.maxWidth / cardSizeRatio);
        }),
      ),
    );
  }

  Widget _buildCard(BuildContext context, double cardWidth, double cardHeight) {
    const textStyle = TextStyle(fontFamily: 'Sarabun', color: Colors.black87);
    GuideLicense license = GuideLicense.fromJson(credential.attrs);
    final regionName = DotDataUtil.setRegionEn(license.regionId).toLowerCase();
    final cardImageSrc =
        'assets/images/dot/tourist-guide-license-$regionName.jpeg';
    //print('image src=[$cardImageSrc]');
    return Container(
      width: cardWidth,
      height: cardHeight,
      padding: const EdgeInsets.all(defaultPadding / 4),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(cardImageSrc),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(1),
            BlendMode.dstATop,
          ),
          //colorFilter: ColorFilter.mode(
          //  Colors.white.withOpacity(0.8),
          //  BlendMode.dstATop,
          //),
        ),
        //color: Colors.white70,
        borderRadius: BorderRadius.all(
          Radius.circular(defaultBorderRadius),
        ),
        /*
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          //colors: [Color(0xFFFAFAFA), Color(0xFFF0F0F0)],
          colors: [
            Color.fromARGB(255, 183, 2, 2),
            Color.fromARGB(255, 210, 54, 54)
          ],
        ),
        */
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              //color: MyTheme.bgColor,
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(defaultBorderRadius),
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 27,
                  //color: Colors.grey,
                  //offset: Offset(0, 3),
                  //blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Container(),
          ),
          //SizedBox(height: 50),
          SizedBox(height: cardHeight * 0.2175),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  //color: Colors.red,
                  //width: cardWidth * 0.333333,
                  width: cardWidth * 0.34,
                  height: cardHeight * 0.62,
                  child: Image(
                      image: AssetImage(
                          "assets/images/person-${license.gender}.png"),
                      color: Colors.white.withOpacity(0.7),
                      colorBlendMode: BlendMode.modulate),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: cardWidth * 0.009555),
                    child: Column(
                      children: [
                        SizedBox(
                          height: cardHeight * 0.125,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: cardWidth * 0.22,
                            ),
                            Text(license.licenseNo,
                                style: textStyle.copyWith(
                                    fontSize: cardWidth * 0.05,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(license.nameTh,
                                style: textStyle.copyWith(
                                    fontSize: cardWidth * 0.035))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(license.nameEn,
                                style: textStyle.copyWith(
                                    fontSize: cardWidth * 0.030))
                          ],
                        ),
                        SizedBox(height: cardHeight * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: cardHeight * 0.02,
                                ),
                                Row(
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: cardWidth * 0.14),
                                      //Text("*-****-*****-**-*")
                                      Text(
                                        "1-2345-67890-12-3",
                                        style: textStyle.copyWith(
                                            fontSize: cardWidth * .023,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ]),
                                SizedBox(height: cardHeight * 0.001),
                                Row(children: [
                                  SizedBox(width: cardWidth * 0.15),
                                  Text(
                                    DateTimeUtil.toExpiryDate(
                                        license.expiryDate,
                                        locale: 'th_TH'),
                                    style: textStyle.copyWith(
                                        fontSize: cardWidth * .0245,
                                        fontWeight: FontWeight.w700),
                                  )
                                ]),
                                Row(children: [
                                  SizedBox(width: cardWidth * 0.15),
                                  Text(
                                    DateTimeUtil.toExpiryDate(
                                        license.expiryDate),
                                    style: textStyle.copyWith(
                                        fontSize: cardWidth * .0245,
                                        fontWeight: FontWeight.w700),
                                  )
                                ]),
                                //Text("dakdfjkajdkfakdjfkj")
                              ],
                            ),
                            SvgPicture.asset(
                              'assets/images/dot/dot-qr2.svg',
                              width: cardWidth * 0.1405,
//                                        height: 48,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Container();
  }
}
