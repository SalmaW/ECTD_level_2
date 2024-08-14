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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
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
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  onTap: () => onClicked(2),
                  iconColor: getColor(2),
                  textColor: getColor(2),
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  onTap: () => onClicked(3),
                  iconColor: getColor(3),
                  textColor: getColor(3),
                  leading: const Icon(Icons.person),
                  title: const Text('Employes'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  onTap: () => onClicked(4),
                  iconColor: getColor(4),
                  textColor: getColor(4),
                  leading: const Icon(Icons.attach_money_outlined),
                  title: const Text('Finances'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  onTap: () => onClicked(5),
                  iconColor: getColor(5),
                  textColor: getColor(5),
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                ),
              ),
            ],
          ),
        )),
        const SizedBox(
          height: 80,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('All Rights Reserved for @MTM , 2023'),
              SizedBox(
                height: 10,
              ),
              Text('Version 1.0.0'),
            ],
          )),
        ),
      ],
    );
  }
}
