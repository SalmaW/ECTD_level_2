import 'package:ectd2/day005/pages/employee_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

var counterNotifier = ValueNotifier(0);

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counterNotifier.value++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "this number will increase anywhere you click at + ",
                style: TextStyle(fontSize: 20),
              ),
              ValueListenableBuilder(
                valueListenable: counterNotifier,
                builder: (context, value, _) {
                  return Text(
                    "$value ",
                    style: const TextStyle(fontSize: 30),
                  );
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const EmployeeList()));
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      size: 55,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      counterNotifier.value = 0;
                    },
                    icon: const Icon(
                      Icons.refresh,
                      size: 55,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
