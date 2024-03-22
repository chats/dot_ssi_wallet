import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:material_symbols_icons/symbols.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.onTertiaryContainer;
    List<Map<String, dynamic>> categories = [
      //{"icon": "assets/icons/blank.svg", "text": "New!"},
      {"icon": Icon(Symbols.home, color: iconColor), "text": "New!"},
      {"icon": Icon(Symbols.favorite, color: iconColor), "text": "Favorites"},
      {
        "icon": Icon(Symbols.document_scanner, color: iconColor),
        "text": "Exam"
      },
      {
        "icon": Icon(Symbols.card_membership, color: iconColor),
        "text": "License"
      },
      {"icon": Icon(Symbols.verified, color: iconColor), "text": "Certs"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            //icon: categories[index]["icon"],
            //icon: categories[index]["icon"],
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);
  final Icon icon;
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(16),
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              //child: SvgPicture.asset(icon),
              child: icon),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
