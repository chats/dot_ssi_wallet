import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../constants/constants.dart';
import '../../models/guide_license_model.dart';
import '../../models/verifiable_credential_model.dart';
import '../../services/core/credential_service.dart';
import '../../widgets/empty_result_card_widget.dart';
import '../../widgets/exam_cert_card.dart';
import '../../widgets/exam_seat_card.dart';
import '../../widgets/tourist_guide_license_card.dart';
import '../../widgets/tourist_guide_license_card2.dart';
import '../../widgets/uknown_card_widget.dart';
import '../../screens/credential_details_screen.dart';
import '../../screens/demo/tourist_guide_license_details.dart';

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
                    /*
                    case examSeatCredDefs:
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: ExamSeatCard(
                          credential: credentials[index],
                          press: () {
                            Get.to(
                              () => CredentialDetailsScreen(
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
                              () => CredentialDetailsScreen(
                                  credential: credentials[index]),
                            );
                          },
                        ),
                      );
*/
                    case guideLicenseCredDefs:
                      final attrs = GuideLicense.fromJson(js["attrs"]);
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: TouristGuideLicenseCard2(
                          credential: credentials[index],
                          press: () {
                            Get.to(
                              () => TouristGuideLiceneseDetailsScreen(
                                  credential: credentials[index]),
                            );
                          },
                        ),
                      );
                    default:
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        //child: Text("Unknown Card"),
                        child: UnknownCard(
                          attrs: credentials[index].attrs,
                          press: () {
                            Get.to(
                              () => CredentialDetailsScreen(
                                  credential: credentials[index]),
                            );
                          },
                        ),
                      );
                  }
                }),
              );
            }
          }
        });
  }
}
