import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/guide_license_model.dart';
import '../../models/verifiable_credential_model.dart';
import '../../services/core/credential_service.dart';
import '../../widgets/empty_result_card_widget.dart';
import '../../widgets/tourist_guide_license_card.dart';
import 'tourist_guide_license_details.dart';

class TouristGuideLicenseListScreen extends StatefulWidget {
  const TouristGuideLicenseListScreen({super.key});

  @override
  State<TouristGuideLicenseListScreen> createState() =>
      _TouristGuideLicenseListScreenState();
}

class _TouristGuideLicenseListScreenState
    extends State<TouristGuideLicenseListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCustomScrollView(
        context,
        _buildList(context),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder(
        //future: getTouristGuideLicenses(),
        future: getCredentials(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            if (!snapshot.hasData) {
              return SliverToBoxAdapter(
                child: emptyResultCard(context, "No credential found."),
              );
            } else {
              //final credentials = snapshot.data as List<TouristGuideLicense>;
              final credentials = snapshot.data as List<VerifiableCredential>;

              return SliverList.builder(
                  itemCount: credentials.length,
                  itemBuilder: ((context, index) {
                    final js = credentials[index].toJson();
                    final license = GuideLicense.fromJson(js["attrs"]);
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: TouristGuideLicenseCard(
                          press: () {
                            Get.to(
                              () => TouristGuideLiceneseDetailsScreen(
                                  credential: credentials[index]),
                            );
                          },
                          license: license),
                    );
                  }));
            }
          }
        });
  }

  Widget _buildCustomScrollView(BuildContext context, Widget sliverWidget) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: false,
          pinned: true,
          expandedHeight: 100,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsets.only(left: 20, bottom: 10),
              title: Text("Credential List")),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          sliver: sliverWidget,
        )
      ],
    );
  }
}
