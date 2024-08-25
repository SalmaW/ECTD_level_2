import 'package:flutter/material.dart';

import '../../utils/app_screenutil.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';

class SetNewPass extends StatefulWidget {
  const SetNewPass({super.key});

  @override
  State<SetNewPass> createState() => _SetNewPassState();
}

class _SetNewPassState extends State<SetNewPass> {
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;

  final passwordConfirmFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37.0),
            child: Column(
              children: [
                // Header
                SizedBox(
                  height: AppScreenUtil.appHeight * 0.15,
                  child: Center(
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: AppScreenUtil.loginTitle,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                // Body (Input fields)
                SizedBox(
                  height: AppScreenUtil.appHeight * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldW(
                        controller: passwordController,
                        labelText: 'New Password',
                        hintText: "*********",
                        obscure: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            passwordFocusNode.requestFocus();
                            return "Password is Required";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 20),
                      TextFieldW(
                        controller: passwordConfirmController,
                        labelText: 'Confirm Password',
                        hintText: "*********",
                        obscure: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            passwordConfirmFocusNode.requestFocus();
                            return "Confirm Password is Required";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                ),
                // Footer (Buttons and Alt Sign-In)
                SizedBox(
                  height: AppScreenUtil.appHeight * 0.35,
                  child: Column(
                    children: [
                      ElevatedButtonW(
                        fixedSized: const Size(316, 57),
                        onPressed: () {},
                        custom: const Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
