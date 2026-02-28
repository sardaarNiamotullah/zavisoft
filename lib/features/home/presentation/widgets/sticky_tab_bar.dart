import 'package:flutter/material.dart';

class StickyTabBar extends StatelessWidget {
  const StickyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PinnedHeaderSliver(
      child: Container(
        color: Colors.white,
        child: TabBar(
          isScrollable: false,
          labelColor: Colors.deepPurple,
          unselectedLabelColor: Colors.black,
          dividerColor: Colors.grey.shade200,
          tabs: [
            Tab(text: 'Men'),
            Tab(text: 'Women'),
            Tab(text: 'Kids'),
          ],
        ),
      ),
    );
  }
}
