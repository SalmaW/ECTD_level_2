import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Welcome To Our App',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
      ],
    );
  }
}
