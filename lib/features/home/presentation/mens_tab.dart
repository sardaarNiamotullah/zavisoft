import 'package:flutter/material.dart';
import 'package:zavisoft/features/home/presentation/widgets/custom_list_tile.dart';

class MensTab extends StatelessWidget {
  const MensTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => CustomListTile(title: 'Mens', index: index) 
    );
  }
}