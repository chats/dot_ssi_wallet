import 'package:dot_ssi_wallet/screens/home/discount_banner.dart';
import 'package:dot_ssi_wallet/screens/home/home_header.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'popular_products.dart';
import 'special_offers.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          HomeHeader(),
          DiscountBanner(),
          Categories(),
          SpecialOffers(),
          SizedBox(height: 20),
          PopularProducts(),
          SizedBox(height: 20),
        ],
      ),
    ));
  }
}
