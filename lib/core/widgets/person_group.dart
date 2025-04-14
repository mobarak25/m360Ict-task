import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:bs_flutter_project_task/core/widgets/text.dart';
import 'package:flutter/material.dart';

class PersonGroup extends StatelessWidget {
  const PersonGroup({
    super.key,
    this.showDetails = true,
    required this.images,
    required this.viewDetails,
  });

  final List<String> images;
  final VoidCallback viewDetails;
  final bool showDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        viewDetails();
      },
      child: Column(
        children: [
          Row(
            children: [
              for (int i = 0; i < images.length; i++)
                Align(
                  widthFactor: 0.5,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(images[i]),
                  ),
                ),
              Align(
                widthFactor: 0.5,
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: bWhite,
                  child: CircleAvatar(
                    radius: 20,
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0XFFD9D9D9),
                        shape: BoxShape.circle,
                      ),
                      child: TextB(
                        text: "+2",
                        fontSize: 16,
                        fontColor: bWhite,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (showDetails)
            Row(
              children: [
                TextB(
                  text: "View Details",
                  fontHeight: 1,
                  fontSize: 12,
                  fontColor: bPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
                Icon(Icons.arrow_right, size: 18, color: bPrimaryColor),
              ],
            ),
        ],
      ),
    );
  }
}
