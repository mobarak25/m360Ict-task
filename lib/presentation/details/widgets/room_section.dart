import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:bs_flutter_project_task/core/widgets/person_group.dart';
import 'package:flutter/material.dart';

class RoomSection extends StatelessWidget {
  const RoomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Persons",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 24,
                    color: Color(0XFF4D4D4D),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PersonGroup(
                      images: [
                        "assets/images/image_1.png",
                        "assets/images/image_2.png",
                        "assets/images/image_3.png",
                      ],
                      showDetails: false,
                      viewDetails: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: bWhite,
              gradient: LinearGradient(
                colors: [Color(0XFFA1FFD0), Color(0XFF6ABC93)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rooms",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 24,
                    color: bWhite,
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
                Text(
                  "5",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 40,
                    color: bWhite,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  decoration: BoxDecoration(
                    color: bWhite,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "2 of them requires action",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 10,
                      color: bPrimaryColor,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
