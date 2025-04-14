import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:bs_flutter_project_task/core/widgets/person_group.dart';
import 'package:bs_flutter_project_task/core/widgets/ppm.dart';
import 'package:bs_flutter_project_task/core/widgets/text.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    this.title = "Home",
    this.tag = "Poor",
    required this.ppmValue,
    required this.viewDetails,
  });
  final String title, tag;

  final int ppmValue;
  final VoidCallback viewDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0XFFF8FFFB), Color(0XFFFFFFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: bBlack.withAlpha(15),
            blurRadius: 10,
            spreadRadius: -2,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextB(
                text: title,
                fontSize: 16,
                fontColor: bBlack,
                fontWeight: FontWeight.w500,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0XFF42D58B),
                      Color(0XFF65D49C),
                      Color(0XFF2DF28F),
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextB(
                  text: tag,
                  fontSize: 12,
                  fontColor: bWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Ppm(ppmValue: ppmValue),

              PersonGroup(
                images: [
                  "assets/images/image_1.png",
                  "assets/images/image_2.png",
                  "assets/images/image_3.png",
                ],
                viewDetails: () {
                  viewDetails();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
