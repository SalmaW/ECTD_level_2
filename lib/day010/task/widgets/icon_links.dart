import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/my_icons.dart';

class IconLinks extends StatelessWidget {
  final double iconSize;

  IconLinks({required this.iconSize, super.key});

  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'salmamaarouf00@gmail.com', // The recipient's email address
    query:
        'subject=Hello%20There&body=This%20is%20a%20test%20email', // The subject and body of the email
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            tooltip: "LinkedIn",
            iconSize: 22,
            onPressed: () => _launchUrl(
                Uri.parse("https://www.linkedin.com/in/salma-maarouf")),
            icon: const Icon(MyIcons.linkedIn)),
        IconButton(
            tooltip: "GitHub",
            iconSize: iconSize,
            onPressed: () =>
                _launchUrl(Uri.parse("https://www.github.com/SalmaW")),
            icon: const Icon(MyIcons.gitHub)),
        IconButton(
            tooltip: "Email",
            iconSize: iconSize,
            onPressed: () => _launchUrl(emailUri),
            icon: const Icon(Icons.mail)),
      ],
    );
  }

  Future<void> _launchUrl(Uri linkUrl) async {
    try {
      if (await canLaunchUrl(linkUrl)) {
        await launchUrl(linkUrl);
      } else {
        throw 'Could not launch $linkUrl';
      }
    } catch (e) {
      print(e);
    }
  }
}
