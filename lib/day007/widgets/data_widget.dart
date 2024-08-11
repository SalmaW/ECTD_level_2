import 'package:flutter/material.dart';

class DataWidget extends StatefulWidget {
  final List<String> data;

  const DataWidget({required this.data, super.key});

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  @override
  Widget build(BuildContext context) {
    print("<<<<<<<<<< Data build trigger");
    return ListView(
      children: widget.data
          .map((e) => ListTile(
                title: Text(e),
              ))
          .toList(),
    );
  }
}
