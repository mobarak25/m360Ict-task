import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:flutter/material.dart';

class Plants extends StatelessWidget {
  const Plants({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: bWhite,
        boxShadow: [
          BoxShadow(
            color: bBlack.withAlpha(15),
            blurRadius: 20,
            spreadRadius: -5,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: 150,
              padding: EdgeInsets.only(left: 25),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Plants",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 24,
                      color: bPrimaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset("assets/images/leaf.png"),
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 150,
              decoration: BoxDecoration(
                color: bWhite,
                gradient: LinearGradient(
                  colors: [Color(0XFFA1FFD0), Color(0XFF6ABC93)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "43",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 70,
                  color: bWhite,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
