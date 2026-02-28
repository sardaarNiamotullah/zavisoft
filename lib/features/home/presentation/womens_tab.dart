import 'package:flutter/material.dart';
import 'package:zavisoft/features/home/presentation/widgets/custom_list_tile.dart';

class WomensTab extends StatelessWidget {
  const WomensTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) =>
          CustomListTile(title: 'Womens', index: index),
    );
  }
}
