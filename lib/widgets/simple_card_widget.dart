import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({
    super.key,
    required this.press,
  });
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

    print('width=${double.maxFinite}');
    double cardWidth = double.maxFinite.roundToDouble();
    double cardHeight = cardWidth / cardSizeRatio;
    print('cardwidth=${cardWidth}');
    print('cardheight=${cardHeight}');
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
          //colors: [Color(0xFFFAFAFA), Color(0xFFF0F0F0)],
          colors: [
            Color.fromARGB(255, 183, 2, 2),
            Color.fromARGB(255, 210, 54, 54)
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
            padding: EdgeInsets.all(2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [Text("ใบรับรองผลการสอบ")],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
