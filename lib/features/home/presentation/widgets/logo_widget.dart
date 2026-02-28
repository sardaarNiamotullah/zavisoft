import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final bool isLargeLogo;
  const LogoWidget({super.key, this.isLargeLogo = false});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: RichText(
        text: TextSpan(
          text: 'Z A V I S O F T',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            fontSize: isLargeLogo ? 24 : 18,
          ),
          children: [
            TextSpan(
              text: ' shop',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: isLargeLogo ? 12 : 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
