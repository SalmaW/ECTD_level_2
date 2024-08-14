import 'package:flutter/material.dart';

import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/app_drawer_widget.dart';

class MobileWidget extends StatefulWidget {
  const MobileWidget({super.key});

  @override
  State<MobileWidget> createState() => _MobileWidgetState();
}

class _MobileWidgetState extends State<MobileWidget> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. U',
                            // maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
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
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          child: AppDrawerWidget(
            selectedIndex: selectedIndex,
            onClicked: (index) {
              setState(() {
                selectedIndex = index;
              });
              _scaffoldKey.currentState?.closeDrawer();
            },
          ),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SingleChildScrollView(
            child: indexWidgetMap[selectedIndex],
          ),
        )),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(3, 0), // changes position of shadow
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        icon: const Icon(Icons.menu)),
                    const Expanded(child: AppBarWidget()),
                  ],
                ),
              ),
            )));
  }
}
