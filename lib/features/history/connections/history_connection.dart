import 'package:dot_ssi_wallet/services/core/connection_service.dart';
import 'package:flutter/material.dart';

import '../../../helpers/dialog_helper.dart';
import '../../../helpers/snackbar_helper.dart';
import '../../../models/connection_model.dart';

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
                        confirmDismiss:
                            (DismissDirection dismissDirection) async {
                          //return await confirmDeletion(context,
                          //    title: 'Delete connection',
                          //    content:
                          //        'Are you sure you want to delete this connection?');
                          return await DialogHelper.confirmDelete(
                            context,
                            title: 'Delete connection',
                            content:
                                'Are you sure you want to delete this connection?',
                          );
                        },
                        direction: DismissDirection.endToStart,
                        onDismissed: (DismissDirection direction) {
                          //print();
                          deleteConnection(connection.connectionId)
                              .then((value) {
                            setState(() {
                              connections.removeAt(index);
                            });
                            SnackbarHelper.showSnackbar(
                                context, 'Connection deleted');
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
  /*
  Future confirmDeletion(
    BuildContext context, {
    required String title,
    required String content,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  foregroundColor:
                      Theme.of(context).colorScheme.onError // Background color
                  ),
            ),
          ],
        );
      },
    );
  }
  */

  /*
  showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.amber,
        ),
      ),
      backgroundColor: Colors.white,
    ));
  }
  */
}
