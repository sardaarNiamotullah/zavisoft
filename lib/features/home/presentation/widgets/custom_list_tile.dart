import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final int index;
  const CustomListTile({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(
        bottom: 10,
        top: index == 0 ? 10 : 0,
        left: 16,
        right: 16,
      ),
      child: ListTile(title: Text('$title item: ${index + 1}')),
    );
  }
}
