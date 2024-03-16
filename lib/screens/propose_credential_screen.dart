import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../constants/app_constants.dart';
import '../constants/constants.dart';
import '../models/connection_model.dart';
import '../services/core/connection_service.dart';
import '../services/core/proof_service.dart';
import '../widgets/empty_result_card_widget.dart';
import 'messages/message_screen.dart';

class ProposePresentationScreen extends StatefulWidget {
  const ProposePresentationScreen(
      {super.key, this.connectionId, this.credDefId, this.attributes});
  final connectionId;
  final credDefId;
  final attributes;

  @override
  State<ProposePresentationScreen> createState() =>
      _ProposePresentationScreenState();
}

class _ProposePresentationScreenState extends State<ProposePresentationScreen> {
  final channel = WebSocketChannel.connect(Uri.parse(agentWss));
  String invitationUrl = "";

  @override
  void initState() {
    super.initState();
    channel.stream.listen((event) {
      if (mounted) {
        setState(() {
          final o = json.decode(event);
          final topic = o["topic"];
          final state = (o["payload"] != null) ? o["payload"]["state"] : "";
          if (topic == "connections" && state == "active") {
            final connectionId = o["payload"]["connection_id"];
            print("connection id $connectionId is actived");
            proposePresentation(
                    connectionId: connectionId,
                    credDefId: widget.credDefId,
                    attributes: widget.attributes)
                .then((value) => Get.off(() => MessageScreen()));
            //.then((value) => Get.to(() => MessageScreen()));
//            Get.back();
          }
        });
      }
    });
    createInvitation()
        .then((value) => {setState(() => invitationUrl = value.invitationUrl)});
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            pinned: true,
            title: Text("Scan to verify"),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            sliver: _buildInvData(context, invitationUrl),
          )
        ],
      ),
    );
  }

  Widget _buildInvData(BuildContext context, String invitationUrl) {
    return invitationUrl.isEmpty
        ? const SliverToBoxAdapter(
            child: CircularProgressIndicator(),
          )
        : SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    //color: Colors.red,

                    child: QrImageView(
                      data: invitationUrl,
                      version: QrVersions.auto,
                      size: 280,
                      gapless: false,
                      //embeddedImage:
                      //    AssetImage('assets/images/my_embedded_image.png'),
                      //embeddedImageStyle: QrEmbeddedImageStyle(
                      //   size: Size(80, 80),
                      //),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Please use verifier app scan qr-code.",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          );
  }

  Widget _buildInvitationData(BuildContext context) {
    return FutureBuilder(
      future: createInvitation(),
      builder: (context, snapshot) {
        //print("snapshot = $snapshot");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          if (!snapshot.hasData) {
            return SliverToBoxAdapter(
              child: emptyResultCard(context, "No invitation created"),
            );
          } else {
            final invitation = snapshot.data as Invitation;
            return SliverList.builder(
              itemCount: 1,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: QrImageView(
                    data: invitation.invitationUrl,
                    version: QrVersions.auto,
                    size: 320,
                    gapless: false,
                    //embeddedImage:
                    //    AssetImage('assets/images/my_embedded_image.png'),
                    //embeddedImageStyle: QrEmbeddedImageStyle(
                    //   size: Size(80, 80),
                    //),
                  ),
                );
              }),
            );
            /*
            return SliverToBoxAdapter(
              child: QrImageView(
                data: invitation.invitationUrl,
                version: QrVersions.auto,
                size: 320,
                gapless: false,
                //embeddedImage:
                //    AssetImage('assets/images/my_embedded_image.png'),
                //embeddedImageStyle: QrEmbeddedImageStyle(
                //   size: Size(80, 80),
                //),
              ),
            );
            */
          }
        }
      },
    );
  }
}
