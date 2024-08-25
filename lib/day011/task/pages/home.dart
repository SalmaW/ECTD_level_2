import 'package:ectd2/day011/task/pages/authentication/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String id = 'home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("home"),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const LogInPage()));
              },
              child: const Text('go')),
        ],
      ),
    );
  }
}
