import 'package:dot_ssi_wallet/services/core/connection_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../models/connection_model.dart';

class ConnectionScreenOld extends StatelessWidget {
  const ConnectionScreenOld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        centerTitle: false,
        pinned: true,
        expandedHeight: 80,
        elevation: 0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          titlePadding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
          title: Text("Connections",
              style: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: buildConnectionList(context),
      ),
    ]));
  }

  Widget buildConnectionList(BuildContext context) {
    return FutureBuilder(
        future: getConnections(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            if (!snapshot.hasData) {
              return const SliverToBoxAdapter(
                child: Center(child: Text("No connections found")),
              );
            } else {
              final connections = snapshot.data as List<Connection>;
              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final connection = connections[index];
                  return connectionTile(context, connection);
                },
                childCount: connections.length,
              ));
            }
          }
        });
  }

  Widget connectionTile(BuildContext context, Connection connection) {
    final state = connection.state;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Slidable(
        key: ValueKey(key),
        endActionPane: sideEndToStart(),
        child: Container(
          decoration: BoxDecoration(
            color:
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text(connection.theirLabel!,
                style: Theme.of(context).textTheme.titleMedium),
            subtitle: switch (state) {
              // TODO: Handle this case.
              "active" => Row(children: [Text('DID: ${connection.theirDid}')]),
              String() =>
                Row(children: [Text('Status: ${connection.rfc23State}')]),
            },
            trailing: stateBadge(state),
            onTap: () {},
          ),
        ),
      ),
    );
  }

//  Widget buildTile(BuildContext context) {
//    return Container();
//  }

  Widget stateBadge(String state) {
    Color color = switch (state) {
      'active' => Colors.green,
      'invitation' || 'request' => Colors.blue,
      'error' => Colors.red,
      String() => Colors.grey[800]
    } as Color;

    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        //color: Colors.green,
        border: Border.all(color: color, width: 1),
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: Text(state,
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.bold)),
      ),
    );
  }

  ActionPane sideEndToStart() {
    return const ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (doNothing),
          backgroundColor: Color(0xFFDE3730),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          label: 'Delete',
          autoClose: true,
        ),
      ],
    );
  }
}

void doNothing(BuildContext context) {}
