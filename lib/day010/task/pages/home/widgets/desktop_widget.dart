import 'package:flutter/material.dart';

import '../../../pages/about_me.dart';
import '../../../utils/app_screenutil.dart';
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
    1: const AboutMe(),
    2: const Text('Location'),
    3: const Text('Phone Number'),
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // app drawer
        Container(
          width: AppScreenUtil.appDrawerW,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              boxShadowWidget(
                customOffSet: const Offset(3, 0),
              ),
            ],
          ),
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
                //appBar
                Container(
                    // height: 30,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      boxShadowWidget(customOffSet: const Offset(13, 0)),
                    ]),
                    child: const AppBarWidget()),
                Expanded(
                  child: SingleChildScrollView(
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
                ),
              ],
            )),
      ],
    );
  }

  BoxShadow boxShadowWidget({required Offset customOffSet}) => BoxShadow(
        color: Colors.black12.withOpacity(0.3),
        spreadRadius: 3,
        blurRadius: 7,
        offset: customOffSet, // changes position of shadow
      );
}
