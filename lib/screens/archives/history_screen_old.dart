import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class HistoryScreenOld extends StatefulWidget {
  const HistoryScreenOld({super.key});
  static const routeName = '/history';

  @override
  State<HistoryScreenOld> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreenOld> {
  List<Map<String, String>> items = [
    {"key": "1", "title": "Connected", "subtitle": "Deparment of Tourism"},
    {
      "key": "2",
      "title": "Credential offer",
      "subtitle": "Tourist Guide License"
    },
    {
      "key": "3",
      "title": "Credential issued",
      "subtitle": "Tourist Guide License"
    },
    {"key": "4", "title": "Proof request", "subtitle": "from Tourist Police"},
    {"key": "5", "title": "Presentation sent", "subtitle": "to Tourist Police"},
    {"key": "6", "title": "Proof request", "subtitle": "from ABC Institute"},
    {"key": "7", "title": "Proof denied", "subtitle": "to ABC Institute"},
    {"key": "8", "title": "Connected", "subtitle": "to Registrar Office"},
    {"key": "9", "title": "Proof request", "subtitle": "from Registrar Office"},
    {
      "key": "10",
      "title": "Presentation sent",
      "subtitle": "to Registrar Office"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            pinned: true,
            expandedHeight: 80,
            //backgroundColor: theme.colorScheme.primary,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
              title: Text("History", style: theme.textTheme.headlineMedium),
            ),
          ),
          //SliverList.builder(itemBuilder: itemBuilder)
          /*
          SliverAppBar(
            pinned: true,
            expandedHeight: 20,
            backgroundColor: Colors.amber,
            centerTitle: false,
            title: I18nText(
              "screen.history_list.title",
              child: Text(
                "",
                style: theme.textTheme.titleMedium,
              ),
            ),
          ),
          */
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(childCount: items.length,
                    (context, index) {
              var i = items[index];
              print(i["title"]);
              return _buildTile(context, i["key"]!, i["title"]!, i["subtitle"]);
            })),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
      BuildContext context, String key, String title, String? subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Slidable(
        key: ValueKey(key),
        endActionPane: _sideEndToStart(),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.8),
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle!),
          ),
        ),
      ),
    );
  }

  ActionPane _sideEndToStart() {
    return const ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: doNothing,
          backgroundColor: Color(0xFFDE3730),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          label: 'Delete',
          autoClose: false,
        ),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return Container(
      width: 60,
      height: 60,
      child: FilledButton(
        onPressed: () {},
        child: Icon(
          Symbols.qr_code_scanner,
          size: 40,
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(0),
//          primary: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          //side: const BorderSide(width: 0),
        ),
      ),
    );
  }

/*
  Widget _histItem(BuildContext context, String title, String message,
      {String? dateStr, AssetImage? ximage}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Container(
//        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Center(
                  child: Icon(
                Symbols.token_rounded,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              )),
              const SizedBox(width: 10),
              /*
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.red,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          dateStr ?? "",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),*/
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title,
                            style: Theme.of(context).textTheme.bodyMedium),
                        Text(dateStr ?? "",
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(message, style: Theme.of(context).textTheme.bodySmall)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  */
}

void doNothing(BuildContext context) {}
