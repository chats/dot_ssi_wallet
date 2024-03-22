import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home_search.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: HomeSearch()),
          const SizedBox(width: 16),
          SvgPicture.asset(
            "assets/icons/blank.svg",
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(
            "assets/icons/blank.svg",
          ),
        ],
      ),
    );
  }
}
