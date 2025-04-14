import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:bs_flutter_project_task/core/widgets/text.dart';
import 'package:flutter/material.dart';

class UserSection extends StatelessWidget {
  const UserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bPrimaryColor.withAlpha(25),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(25, 48, 25, 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          TextB(
                            text: "Good Morning",
                            fontSize: 16,
                            fontColor: Color(0XFF838383),
                            fontWeight: FontWeight.w300,
                          ),
                          TextB(
                            text: "Ahmed Ariyan",
                            fontSize: 24,
                            fontColor: Color(0XFF1E1E1E),
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 94,
                      height: 94,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset("assets/images/user.png"),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    text: "You are in a ",
                    style: TextStyle(
                      color: Color(0XFF838383),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: "healthy ",
                        style: TextStyle(
                          color: bPrimaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(text: "environment"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/user_bg.png",
              width: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
