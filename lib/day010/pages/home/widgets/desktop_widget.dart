import 'package:flutter/material.dart';

import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/app_drawer_widget.dart';

class DesktopWidget extends StatefulWidget {
  const DesktopWidget({super.key});

  @override
  State<DesktopWidget> createState() => _DesktopWidgetState();
}

class _DesktopWidgetState extends State<DesktopWidget> {
  int selectedIndex = 1;
  Map<int, Widget> indexWidgetMap = {
    1: Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(
          25,
          (index) => SizedBox(
                height: 150,
                width: 150,
                child: PhysicalModel(
                  borderRadius: BorderRadius.circular(15),
                  elevation: 5,
                  color: Colors.white,
                  shadowColor: Colors.black12,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('5'),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. U',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    ),
    2: const Text('Settings'),
    3: const Text('Employees'),
    4: const Text('Finances')
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 300,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(3, 0), // changes position of shadow
            )
          ]),
          child: AppDrawerWidget(
              selectedIndex: selectedIndex,
              onClicked: (index) {
                setState(() {
                  selectedIndex = index;
                });
              }),
        ),
        Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                    height: 100,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset:
                            const Offset(13, 0), // changes position of shadow
                      )
                    ]),
                    child: const AppBarWidget()),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width / 1.5,
                      ),
                      child: indexWidgetMap[selectedIndex],
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
