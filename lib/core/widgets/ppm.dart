import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:bs_flutter_project_task/core/widgets/text.dart';
import 'package:flutter/material.dart';

class Ppm extends StatelessWidget {
  const Ppm({super.key, required this.ppmValue});

  final int ppmValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextB(
          text: "$ppmValue",
          fontSize: 43,
          fontColor: bPrimaryColor,
          fontWeight: FontWeight.w300,
        ),
        SizedBox(width: 2),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: bPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextB(
                text: "▼ 13%",
                fontSize: 11,
                fontColor: bWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextB(
              text: "ppm",
              fontSize: 14,
              fontColor: bPrimaryColor,
              fontWeight: FontWeight.w300,
              fontHeight: 1,
            ),
          ],
        ),
      ],
    );
  }
}
