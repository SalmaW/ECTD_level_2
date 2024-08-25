import 'package:ectd2/day011/task/pages/authentication/set_new_pass.dart';
import 'package:flutter/material.dart';

import '../../utils/app_screenutil.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';

class ResetVerification extends StatefulWidget {
  const ResetVerification({super.key});

  @override
  State<ResetVerification> createState() => _ResetVerificationState();
}

class _ResetVerificationState extends State<ResetVerification> {
  late TextEditingController emailController;

  final emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
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
                        controller: emailController,
                        labelText: 'Email',
                        hintText: "email@example.com",
                        validator: (value) {
                          if (value!.isEmpty) {
                            emailFocusNode.requestFocus();
                            return "Email is Required";
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const SetNewPass(),
                            ),
                          );
                        },
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
