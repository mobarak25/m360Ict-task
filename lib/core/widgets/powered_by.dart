import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:flutter/material.dart';

class PoweredBy extends StatelessWidget {
  const PoweredBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 30, top: 10),
      child: RichText(
        text: TextSpan(
          text: "Powered by ",
          style: TextStyle(color: bGray, fontSize: 12, fontFamily: "Inter"),
          children: [
            TextSpan(
              text: "M360 ICT",
              style: TextStyle(
                color: bPrimaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
