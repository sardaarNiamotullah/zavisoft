import 'package:flutter/material.dart';
import 'package:zavisoft/features/home/presentation/widgets/custom_list_tile.dart';

class KidsTab extends StatelessWidget {
  const KidsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) =>
          CustomListTile(title: 'Kids', index: index),
    );
  }
}
