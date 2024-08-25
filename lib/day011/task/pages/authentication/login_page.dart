import 'package:ectd2/day011/task/pages/authentication/reset_pass_verification.dart';
import 'package:ectd2/day011/task/pages/authentication/signup_page.dart';
import 'package:ectd2/day011/task/widgets/alt_sign_in_row.dart';
import 'package:ectd2/day011/task/widgets/auth/auth_template.dart';
import 'package:ectd2/day011/task/widgets/underscore_spacer.dart';
import 'package:flutter/material.dart';

import '../../utils/app_screenutil.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      onLogin: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => const LogInPage(),
          ),
        );
      },
      body: [
        TextFieldW(
          controller: emailController,
          labelText: 'Email',
          textInputType: TextInputType.emailAddress,
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
        const SizedBox(height: 40),
        TextFieldW(
          controller: passwordController,
          labelText: 'Password',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResetVerification()));
              },
              child: const Text("Forgot Password?"),
            ),
          ],
        ),
      ],
    );
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 37.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButtonW(
              fixedSized: const Size(316, 57),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const LogInPage(),
                  ),
                );
              },
              custom: const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  UnderscoreSeparator(),
                  Text(
                    "    Or Sign in With    ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  UnderscoreSeparator(),
                ],
              ),
            ),
            const AltSignInRow(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const SignUpPage(),
                      ),
                    );
                  },
                  child: const Text("Sign Up Here"),
                ),
              ],
            ),
          ],
        ),
      ),
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
                      "Login",
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
                      const SizedBox(height: 40),
                      TextFieldW(
                        controller: passwordController,
                        labelText: 'Password',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ResetVerification()));
                            },
                            child: const Text("Forgot Password?"),
                          ),
                        ],
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
