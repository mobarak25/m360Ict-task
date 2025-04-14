import 'package:bs_flutter_project_task/core/router/route_constents.dart';
import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:flutter/material.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key, required this.isLoginScreen});

  final bool isLoginScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLoginScreen
              ? "Don't have an account? "
              : "Already have an account? ",
          style: TextStyle(fontFamily: "Inter", fontSize: 14, color: bGray),
        ),
        GestureDetector(
          onTap: () {
            if (isLoginScreen) {
              Navigator.of(context).pushReplacementNamed(signUp);
            } else {
              Navigator.of(context).pushReplacementNamed(signIn);
            }
          },
          child: Text(
            isLoginScreen ? "Sign Up" : "Sign In",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: bPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
