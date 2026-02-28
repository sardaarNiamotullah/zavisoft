import 'package:flutter/material.dart';
import 'package:zavisoft/features/home/presentation/widgets/logo_widget.dart';

class CollapsibleAppBar extends StatelessWidget {
  const CollapsibleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu, color: Colors.white),
      ),
      title: const LogoWidget(),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 12),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 16,
            child: Icon(Icons.person, color: Colors.deepPurple),
          ),
        ),
      ],
    );
  }
}