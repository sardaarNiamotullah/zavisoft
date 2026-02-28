import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final bool islargeLoge;
  const LogoWidget({super.key, this.islargeLoge = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Z A V I S O F T',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        fontSize: islargeLoge ? 30 : 20,
      ),
    );
  }
}
