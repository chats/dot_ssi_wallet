import 'package:dot_ssi_wallet/services/core/connection_service.dart';
import 'package:flutter/material.dart';

import '../../models/connection_model.dart';

class HistoryConnection extends StatefulWidget {
  const HistoryConnection({super.key});

  @override
  State<HistoryConnection> createState() => _HistoryConnectionState();
}

class _HistoryConnectionState extends State<HistoryConnection> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Card(
        child: FutureBuilder(
          future: getConnections(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Center(child: Text("No connections found"));
              } else {
                final connections = snapshot.data as List<Connection>;
                /*
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final connection = connections[index];
                      return connectionTile(context, connection);
                    },
                    childCount: connections.length,
                  ),
                );
                */
                return ListView.separated(
                  itemCount: connections.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    final connection = connections[index];
                    return Dismissible(
                        background: Container(
                          color: theme.colorScheme.error,
                          child: Icon(Icons.delete,
                              color: theme.colorScheme.onError),
                        ),
                        key: ValueKey(connections[index]),
                        onDismissed: (DismissDirection direction) {
                          deleteConnection(connection.connectionId)
                              .then((value) {
                            setState(() {
                              connections.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Connection deleted',
                                style: TextStyle(
                                  color: theme.colorScheme.onTertiary,
                                ),
                              ),
                              backgroundColor: theme.colorScheme.tertiary,
                            ));
                          });
                        },
                        child: connectionTile(context, connection));
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }

  Widget connectionTile(BuildContext context, Connection connection) {
    final theme = Theme.of(context);
    final label = connection.theirLabel!;
    return ListTile(
      title: Text(label.isNotEmpty ? label : 'Unknown',
          style: theme.textTheme.bodyMedium),
      subtitle: Text('State: ${connection.state}'),
    );
  }
}
