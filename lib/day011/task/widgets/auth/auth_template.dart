import 'package:ectd2/day011/task/pages/authentication/login_page.dart';
import 'package:flutter/material.dart';

import '../../pages/authentication/signup_page.dart';
import '../../utils/app_screenutil.dart';
import '../alt_sign_in_row.dart';
import '../elevated_button.dart';
import '../underscore_spacer.dart';

class AuthTemplate extends StatelessWidget {
  final void Function()? onLogin;
  final void Function()? onSignup;
  final List<Widget> body;

  AuthTemplate({required this.body, this.onLogin, this.onSignup, super.key}) {
    assert(onLogin != null || onSignup != null,
        'onLogin or onSignup should not be null');
  }

  bool get isLoggedIn => onLogin != null;

  String get title => isLoggedIn ? 'Login' : 'Sing Up';
  late TextEditingController emailController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController passwordConfirmController =
      TextEditingController();

  final emailFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final passwordConfirmFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: AppScreenUtil.authPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButtonW(
              fixedSized: const Size(316, 57),
              onPressed: isLoggedIn ? onLogin! : onSignup!,
              custom: Text(
                title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: AppScreenUtil.authPaddingV,
              child: const Row(
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
                Text(isLoggedIn
                    ? "Don't have an account? "
                    : "Already have an account? "),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) =>
                            isLoggedIn ? const SignUpPage() : const LogInPage(),
                      ),
                    );
                  },
                  child: Text(isLoggedIn ? "Sign Up Here" : "Login  Here"),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppScreenUtil.authPaddingH,
            child: Column(
              children: [
                // Header
                SizedBox(
                  height: AppScreenUtil.appHeight * 0.15,
                  child: Center(
                    child: Text(
                      title,
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
                  child: Form(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: body),
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
