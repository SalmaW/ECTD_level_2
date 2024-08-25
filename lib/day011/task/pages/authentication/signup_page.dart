import 'package:ectd2/day011/task/pages/authentication/login_page.dart';
import 'package:ectd2/day011/task/widgets/auth/auth_template.dart';
import 'package:flutter/material.dart';

import '../../utils/app_screenutil.dart';
import '../../widgets/alt_sign_in_row.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';
import '../../widgets/underscore_spacer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;

  final emailFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final passwordConfirmFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      onSignup: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (ctx) => LogInPage()));
      },
      body: [
        TextFieldW(
          controller: nameController,
          labelText: 'Full Name',
          hintText: "John Doe",
          validator: (value) {
            if (value!.isEmpty) {
              nameFocusNode.requestFocus();
              return "Name is Required";
            }
            return null;
          },
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),
        TextFieldW(
          controller: emailController,
          labelText: 'Email',
          hintText: "email@example.com",
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              emailFocusNode.requestFocus();
              return "Email is Required";
            }
            return null;
          },
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),
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
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (ctx) => LogInPage()));
              },
              custom: const Text(
                'SIGN UP',
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
                  Expanded(child: UnderscoreSeparator()),
                  Text(
                    "    Or Sign in With    ",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Expanded(child: UnderscoreSeparator()),
                ],
              ),
            ),
            const AltSignInRow(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? "),
                TextButton(
                    iconAlignment: IconAlignment.start,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const LogInPage()));
                    },
                    child: const Text("Login  Here")),
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
                SizedBox(
                  height: AppScreenUtil.appHeight * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: AppScreenUtil.loginTitle,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppScreenUtil.appHeight * 0.5,
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFieldW(
                            controller: nameController,
                            labelText: 'Full Name',
                            hintText: "John Doe",
                            validator: (value) {
                              if (value!.isEmpty) {
                                nameFocusNode.requestFocus();
                                return "Name is Required";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 20),
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
                          const SizedBox(height: 20),
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
