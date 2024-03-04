import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../models/exam_seat_model.dart';
import '../models/guide_license_model.dart';
import '../models/verifiable_credential_model.dart';
import '../services/core/credential_service.dart';
import '../widgets/credential_item_widget.dart';
import '../widgets/empty_result_card_widget.dart';
import '../widgets/exam_cert_card.dart';
import '../widgets/exam_seat_card.dart';
import '../widgets/tourist_guide_license_card.dart';
import 'credential_detail_screen.dart';
import 'demo/tourist_guide_license_details.dart';

class CredentialScreen extends StatefulWidget {
  const CredentialScreen({super.key});

  @override
  State<CredentialScreen> createState() => _CredentialScreenState();
}

class _CredentialScreenState extends State<CredentialScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          centerTitle: false,
          pinned: true,
          expandedHeight: 80,
          //backgroundColor: theme.colorScheme.primary,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
            title: Text("Credentials", style: theme.textTheme.headlineSmall),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          sliver: _buildCredentialList(context),
        )
      ]),
    );
  }

  Widget _buildCredentialList(BuildContext context) {
    return FutureBuilder(
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
                  final creddef = js["cred_def_id"];

                  //return Container();
                  switch (creddef) {
                    case examSeatCredDefs:
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: ExamSeatCard(
                          credential: credentials[index],
                          press: () {
                            Get.to(
                              () => CredentialDetailScreen(
                                  credential: credentials[index]),
                            );
                          },
                        ),
                      );

                    case examCertCredDefs:
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: ExamCertCard(
                          credential: credentials[index],
                          press: () {
                            Get.to(
                              () => CredentialDetailScreen(
                                  credential: credentials[index]),
                            );
                          },
                        ),
                      );

                    case guideLicenseCredDefs:
                      final attrs = GuideLicense.fromJson(js["attrs"]);
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: TouristGuideLicenseCard(
                          license: attrs,
                          press: () {
                            Get.to(
                              () => TouristGuideLiceneseDetailsScreen(
                                  credential: credentials[index]),
                            );
                          },
                        ),
                      );
                  }

                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      child: Text("Test"),
                    ),
                    /*
                      child: TourGuideLicenseCard(
                          press: () {
                            Get.to(
                              () => TouristGuideLiceneseDetailsScreen(
                                  credential: credentials[index]),
                            );
                          },
                          license: license),
                          */
                  );
                }),
              );
            }
          }
        });
  }
}
