import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
              "Enthusiastic Flutter developer eager to kickstart a career in mobile app development. Excited to join a company that valuesgrowth and offers exciting projects to work on. Dedicated to making a positive impact while continually expanding my skills inFlutter development."),
        ),
      ),
    );
  }
}
