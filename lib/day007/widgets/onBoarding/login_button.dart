import 'package:ectd2/day007/pages/login_page.dart';
import 'package:ectd2/day007/services/pref_services.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utility.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 50),
          backgroundColor: ColorUtility.secondary,
          shadowColor: Colors.transparent,
        ),
        onPressed: () => onLogin(),
        child: const Text(
          'Log In',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void onLogin() {
    PrefServices.isOnBoardingSeen = true;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
