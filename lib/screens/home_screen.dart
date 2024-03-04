import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        //backgroundColor: MyTheme.color,
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          //shrinkWrap: true,
          slivers: [
            SliverAppBar(
              backgroundColor: theme.colorScheme.tertiary,

              //title: Text("Test"),
              expandedHeight: 80,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    //color: MyTheme.color,
                    color: Theme.of(context).primaryColor),
                titlePadding: const EdgeInsets.all(20),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "สวัสดี",
                      style: TextStyle(
                          color: theme.colorScheme.onPrimary, fontSize: 18),
                    ),
                    CircleAvatar(
                      //backgroundColor: MyTheme.bgColor.withOpacity(0.5),
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      child: Image.asset(
                        'assets/images/avatar.png',
                        width: 20,
                      ),
                      maxRadius: 15,
                    ),
                  ],
                ),
                centerTitle: false,
              ),
              //floating: true,
            ),
            _buildCard(context),
            //_licenseDetails(demo_tour_guide_licenses[2]),
            SliverFillRemaining(child: Container())
          ],
        ));
  }

  Widget _buildCard(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 221,
        //color: Colors.red,
        child: Stack(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                //color: Colors.red,
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            _sampleCard()
          ],
        ),
      ),
    );
  }

  Widget _sampleCard() {
    return Positioned(
      //top: 10.0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        height: 214,
        //color: Colors.red,
        child: Container(),
        //child: TourGuideLicenseCard(
        //  press: () {},
        //  license: demo_tour_guide_licenses[2],
        //  width: 340,
        //),
      ),
    );
  }
}
