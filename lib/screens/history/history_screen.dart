import 'package:flutter/material.dart';

import 'history_connection.dart';
import 'history_transaction.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: false,
                pinned: false,
                expandedHeight: 70,
                //floating: false,
                //backgroundColor: theme.colorScheme.primaryContainer,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                  title: Text(
                    "History",
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              SliverAppBar(
                primary: false,
                pinned: true,
                elevation: 8,
                //backgroundColor: theme.colorScheme.primaryContainer,
                title: Align(
                  alignment: AlignmentDirectional.center,
                  child: TabBar(
                    indicatorColor: theme.colorScheme.tertiary,
                    isScrollable: true,
                    tabs: [
                      Tab(text: "Transactions"),
                      Tab(text: "Connections"),
                      //                    Tab(text: "Presentation sent"),
                      //                    Tab(text: "Presentation sent"),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 1000,
                  child: TabBarView(
                    children: [
                      HistoryTransaction(),
                      HistoryConnection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
