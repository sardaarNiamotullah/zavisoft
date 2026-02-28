import 'package:flutter/material.dart';
import 'package:zavisoft/features/home/presentation/tabs/mens_tab.dart';
import 'package:zavisoft/features/home/presentation/tabs/others_tab.dart';
import 'package:zavisoft/features/home/presentation/tabs/womens_tab.dart';
import 'package:zavisoft/features/home/presentation/widgets/collapsible_header.dart';
import 'package:zavisoft/features/home/presentation/widgets/sticky_tab_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: SafeArea(
          bottom: false,
          child: Container(
            color: Colors.grey.shade200,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return const [CollapsibleHeader(), StickyTabBar()];
              },
              body: const TabBarView(
                children: [MensTab(), WomensTab(), OthersTab()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
