import 'package:flutter/material.dart';
import 'package:zavisoft/features/home/presentation/tabs/mens_tab.dart';
import 'package:zavisoft/features/home/presentation/tabs/others_tab.dart';
import 'package:zavisoft/features/home/presentation/tabs/womens_tab.dart';
import 'package:zavisoft/features/home/presentation/widgets/collapsible_app_bar.dart';
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
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                    sliver: SliverAppBar(
                      pinned: true,
                      expandedHeight: 110,
                      toolbarHeight: 0,
                      backgroundColor: Colors.deepPurple,

                      //==============================================================================
                      // Collapsible AppBar
                      //==============================================================================
                      flexibleSpace: const FlexibleSpaceBar(
                        background: CollapsibleAppBar(),
                      ),

                      //==============================================================================
                      // Pinned TabBar
                      //==============================================================================
                      bottom: const PreferredSize(
                        preferredSize: Size.fromHeight(48),
                        child: StickyTabBar(),
                      ),
                    ),
                  ),
                ];
              },

              //==============================================================================
              // TabBarView with Mens, Womens, and Others tabs
              //==============================================================================
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
