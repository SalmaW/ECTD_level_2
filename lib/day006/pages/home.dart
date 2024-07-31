import 'package:ectd2/day006/widgets/data_widget.dart';
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
    print("<<<<<<<<<< home build trigger");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: DataWidget(
          data: [
            'Item 1',
            'Item 2',
            'Item 3',
            'Item 4',
            'Item 5',
            'Item 6',
            'Item 7',
            'Item 8',
            'Item 9',
            'Item 10',
          ],
        ),
      ),
    );
  }
}
