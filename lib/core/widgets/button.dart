import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'text.dart';

class ButtonB extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color borderColor;
  final Color? bgColor;
  final double? heigh;

  final double? fontSize;
  final VoidCallback press;
  final bool loading;
  final FontWeight fontWeight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final String svgIcon;
  final double? svgIconSize;

  final String iconPosition;

  const ButtonB({
    super.key,
    required this.text,
    this.textColor = bWhite,
    this.bgColor = bPrimaryColor,
    this.svgIcon = '',
    this.svgIconSize,
    this.borderColor = Colors.transparent,
    this.heigh = 20,

    required this.press,
    this.fontSize = 17,
    this.fontWeight = FontWeight.w500,
    this.loading = false,
    this.horizontalPadding,
    this.verticalPadding,
    this.iconPosition = "right",
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(7),
      child: InkWell(
        onTap: press,
        child: Ink(
          height: heigh,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPosition == 'left')
                if (loading)
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      color: textColor,
                      strokeWidth: 1.5,
                    ),
                  )
                else
                  SvgPicture.asset(
                    svgIcon,
                    width: svgIconSize,
                    colorFilter: ColorFilter.mode(textColor!, BlendMode.srcIn),
                  ),
              SizedBox(width: horizontalPadding ?? 20),
              Text(
                text!,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize,
                  fontFamily: "Inter",
                ),
              ),
              SizedBox(width: horizontalPadding ?? 20),
              if (iconPosition == 'right')
                if (loading)
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      color: textColor,
                      strokeWidth: 1.5,
                    ),
                  )
                else
                  SvgPicture.asset(
                    svgIcon,
                    width: svgIconSize,
                    colorFilter: ColorFilter.mode(textColor!, BlendMode.srcIn),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
