import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppLoginIcons extends StatelessWidget {
  const AppLoginIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildIcons(url: "assets/images/google.png", press: () {}),
        buildIcons(url: "assets/images/facebook.png", press: () {}),
        buildIcons(url: "assets/images/microsoft.png", press: () {}),
        buildIcons(url: "assets/images/apple.png", press: () {}),
      ],
    );
  }

  Container buildIcons({required String url, required VoidCallback press}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          press();
        },
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: bWhite,

            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: bPrimaryColor.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Image.asset(url),
        ),
      ),
    );
  }
}
