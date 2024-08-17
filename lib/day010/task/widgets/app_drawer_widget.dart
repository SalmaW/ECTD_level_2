import 'package:flutter/material.dart';

class AppDrawerWidget extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onClicked;

  const AppDrawerWidget(
      {required this.selectedIndex, required this.onClicked, super.key});

  Color getColor(int index) {
    if (index == selectedIndex) {
      return Colors.indigo;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/images/salma.jpg"),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    onTap: () => onClicked(1),
                    iconColor: getColor(1),
                    textColor: getColor(1),
                    leading: const Icon(Icons.person),
                    title: const Text('About Me'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    onTap: () => onClicked(2),
                    iconColor: getColor(2),
                    textColor: getColor(2),
                    leading: const Icon(Icons.location_pin),
                    title: const Text('Cairo, Egypt'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    onTap: () => onClicked(3),
                    iconColor: getColor(3),
                    textColor: getColor(3),
                    leading: const Icon(Icons.call),
                    title: const Text('(+20) 1144711355'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 80,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'All Rights Reserved for @MTM , 2023',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Version 1.0.0'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
