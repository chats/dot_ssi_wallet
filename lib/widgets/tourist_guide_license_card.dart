import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../models/guide_license_model.dart';
import '../utils/datetime_utils.dart';
import '../utils/dot_data_utils.dart';

class TouristGuideLicenseCard extends StatelessWidget {
  const TouristGuideLicenseCard({
    super.key,
    required this.press,
    required this.license,
  });
//  final double? width;
  final GuideLicense license;
  final VoidCallback press;

  static const double cardSizeRatio = 1.58577250834;
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('th_TH', null);
//    double cardHeight = 154.0;
//    double cardWidth = cardHeight * cardSizeRatio;

//    if (width! > 0.00) {
//      cardWidth = width!;
//      cardHeight = width! / cardSizeRatio;
//    }

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
    const cardTextColor = Colors.black87;
    return Container(
      width: cardWidth,
      height: cardHeight,
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: const BoxDecoration(
        //color: Colors.white70,
        borderRadius: BorderRadius.all(
          Radius.circular(defaultBorderRadius),
        ),

        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFAFAFA), Color(0xFFF0F0F0)],
        ),
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
          //const SizedBox(height: defaultPadding / 2),
          Padding(
            padding: const EdgeInsets.all(2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image(
                      height: cardHeight * 0.1,
                      image: AssetImage("assets/images/thailand_flag.png"),
                    ),
                    Text(
                      "ประเทศไทย",
                      style: TextStyle(
                          fontSize: cardWidth * 0.0155555,
                          height: cardHeight * 0.008,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("THAILAND",
                        style: TextStyle(
                            fontSize: cardWidth * 0.01354555,
                            height: cardHeight * 0.003))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ใบอนุญาตเป็นมัคคุเทศก์",
                      /*
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: GoogleFonts.sarabunTextTheme(),
                              fontSize: cardWidth * 0.03555555556,
                              fontWeight: FontWeight.bold),*/
                      style: GoogleFonts.sarabun(
                        textStyle: TextStyle(
                            //color: Theme.of(context).colorScheme.primary,
                            color: Colors.black87,
                            fontSize: cardWidth * 0.03555555556,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "TOURIST GUIDE LICENSE",
                      /*
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: cardWidth * 0.0255555556,
                              fontWeight: FontWeight.w300),*/
                      style: GoogleFonts.sarabun(
                        textStyle: TextStyle(
                            //color: Theme.of(context).colorScheme.primary,
                            color: Colors.black87,
                            fontSize: cardWidth * 0.0245555556,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
                Image(
                  height: cardHeight * 0.1857777,
                  image: AssetImage("assets/images/dot/dot-logo-500.png"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              //color: Colors.blue,
              //                height: 40,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  //color: Colors.red,
                  //width: cardWidth * 0.333333,
                  width: cardWidth * 0.30,
                  height: cardHeight * 0.5,
                  child: const Image(
                    image: AssetImage("assets/images/dummy-man.png"),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: cardWidth * 0.009555),
                    child: Column(
                      //mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: cardHeight * 0.01,
                            //bottom: cardWidth * 0.005,
                          ),
                          //height: 5,
                          width: double.infinity,
                          //width: double.infinity,
                          color: DotDataUtil.getRegionColor(license.regionId),
                          child: Column(children: [
                            Text(
                              license.regionId == "0"
                                  ? DotDataUtil.setRegionTh(license.regionId)
                                  : "ใบอนุญาตเป็นมัคคุเทศก์เฉพาะภูมิภาค ${DotDataUtil.setRegionTh(license.regionId)}",
                              style: GoogleFonts.sarabun(
                                textStyle: TextStyle(
                                    //color: Theme.of(context).colorScheme.primary,
                                    color: Colors.black87,
                                    fontSize: cardWidth * 0.01659999999,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Text(
                              "${DotDataUtil.setRegionEn(license.regionId)} Tourist Guide License",
                              style: GoogleFonts.sarabun(
                                textStyle: TextStyle(
                                    //color: Theme.of(context).colorScheme.primary,
                                    color: cardTextColor,
                                    fontSize: cardWidth * 0.018,
                                    fontWeight: FontWeight.normal),
                              ),
                            )
                          ]),
                        ),
                        SizedBox(
                          height: cardHeight * 0.02,
                        ),
                        Row(
                          children: [
                            Text(
                              "ใบอนุญาตเลขที่\nLicense No. ",
                              style: GoogleFonts.sarabun(
                                textStyle: TextStyle(
                                    //color: Theme.of(context).colorScheme.primary,
                                    color: cardTextColor,
                                    fontSize: cardWidth * 0.025,
                                    fontWeight: FontWeight.normal),
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(width: cardWidth * 0.03),
                            Text(
                              license.licenseNo,
                              style: GoogleFonts.sarabun(
                                textStyle: TextStyle(
                                    //color: Theme.of(context).colorScheme.primary,
                                    color: cardTextColor,
                                    fontSize: cardWidth * 0.04,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: cardHeight * 0.015),
                        Text(
                          '${license.nameTh}',
                          style: GoogleFonts.sarabun(
                            textStyle: TextStyle(
                                //color: Theme.of(context).colorScheme.primary,
                                color: cardTextColor,
                                fontSize: cardWidth * 0.028,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Text(
                          '${license.nameEn}',
                          style: GoogleFonts.sarabun(
                            textStyle: TextStyle(
                                //color: Theme.of(context).colorScheme.primary,
                                color: cardTextColor,
                                fontSize: cardWidth * 0.025,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(height: cardHeight * 0.009888),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ID No. x xxxx xxxxx xx x",
                                  style: GoogleFonts.sarabun(
                                    textStyle: TextStyle(
                                        //color: Theme.of(context).colorScheme.primary,
                                        color: cardTextColor,
                                        fontSize: cardWidth * 0.025,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(height: cardHeight * 0.00055),
                                Text(
                                  "วันหมดอายุ   ${DateTimeUtil.toExpiryDate(license.expiryDate, locale: 'th_TH')}",
                                  style: GoogleFonts.sarabun(
                                    textStyle: TextStyle(
                                        //color: Theme.of(context).colorScheme.primary,
                                        color: cardTextColor,
                                        fontSize: cardWidth * 0.025,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Text(
                                  "Expiry Date   ${DateTimeUtil.toExpiryDate(license.expiryDate)}",
                                  style: GoogleFonts.sarabun(
                                    textStyle: TextStyle(
                                        //color: Theme.of(context).colorScheme.primary,
                                        color: cardTextColor,
                                        fontSize: cardWidth * 0.025,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: cardWidth * 0.065),
                            SvgPicture.asset(
                              'assets/images/dot/dot-qr2.svg',
                              width: cardWidth * 0.1200,
//                                        height: 48,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
              //width: 50,
            ),
          )
        ],
      ),
    );
  }
}
