import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../models/exam_certificate_model.dart';
import '../models/verifiable_credential_model.dart';

class ExamCertCard extends StatelessWidget {
  const ExamCertCard(
      {super.key,
      required this.credential,
      required this.press,
      this.width = 0.00});
  final double? width;
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
    //}

    final ExamCertificate examCert = ExamCertificate.fromJson(credential.attrs);

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
          final cardWidth = width! > 0.00 ? width! : constraints.maxWidth;
          final cardHeight = cardWidth / cardSizeRatio;
          return _buildCard(context, cardWidth, cardHeight, examCert);
        }),
      ),
    );
  }

  Widget _buildCard(BuildContext context, double cardWidth, double cardHeight,
      ExamCertificate examCert) {
    const cardTextColor = Colors.white;
    return Container(
      width: cardWidth,
      height: cardHeight,
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        //color: Colors.white70,
        image: DecorationImage(
          image: const AssetImage('assets/images/dot/dot-logo-500.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.04),
            BlendMode.dstATop,
          ),
          //colorFilter: ColorFilter.mode(
          //  Colors.white.withOpacity(0.8),
          //  BlendMode.dstATop,
          //),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultBorderRadius),
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
          Padding(
            padding: const EdgeInsets.all(2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ใบรับรองผลการสอบ",
                            style: TextStyle(
                                fontSize: cardWidth * 0.045,
                                fontWeight: FontWeight.w600,
                                color: cardTextColor)),
                        const SizedBox(height: 8),
                        Text('เลขที่: ${examCert.certificateNumber}',
                            style: TextStyle(
                                fontSize: cardWidth * 0.045,
                                color: cardTextColor)),
                        Text('ประเภท: ${examCert.certificateType}',
                            style: TextStyle(
                                fontSize: cardWidth * 0.035,
                                color: cardTextColor)),
                        Text(
                            "${examCert.titleName} ${examCert.firstName} ${examCert.lastName}",
                            style: TextStyle(
                                fontSize: cardWidth * 0.045,
                                color: cardTextColor)),
                        Text(
                            DateFormat('d MMM yyyy', 'th_TH')
                                .format(DateTime.parse(examCert.createdAt)),
                            style: TextStyle(
                                fontSize: cardWidth * 0.045,
                                color: cardTextColor)),
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
}
