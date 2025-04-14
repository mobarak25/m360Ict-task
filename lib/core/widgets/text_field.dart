import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:bs_flutter_project_task/core/theme/typography.dart';
import 'package:bs_flutter_project_task/core/widgets/text.dart';
import 'package:flutter/material.dart';

class TextFieldB extends StatefulWidget {
  final String? hintText, fieldTitle, labelText, errorText, helperText;
  final double? paddingHeight, paddingWidth, height;
  final TextStyle? textStyle;
  final bool isReadOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final FocusNode focusNode;
  final bool obscureText;
  final TextInputType? textInputType;
  final TextAlign? textAlign;
  final VoidCallback? onTouch;
  final Function onChanged;
  final Color? bgColor, hintColor, borderColor;
  final double labelSize;
  final bool loading;
  final bool isDate;

  const TextFieldB({
    super.key,
    this.hintText = "",
    this.fieldTitle = "",
    this.textStyle = bBase,
    this.labelText,
    this.errorText = '',
    this.helperText = '',
    this.maxLines = 1,
    this.maxLength,
    this.controller,
    required this.focusNode,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.textAlign = TextAlign.start,
    this.paddingHeight = 0,
    this.paddingWidth = 0,
    this.onTouch,
    this.height,
    this.bgColor,
    required this.onChanged,
    this.isReadOnly = false,

    this.hintColor,
    this.borderColor,
    this.labelSize = 12,
    this.loading = false,
    this.isDate = false,
  });

  @override
  State<StatefulWidget> createState() {
    return _TextField();
  }
}

class _TextField extends State<TextFieldB> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.fieldTitle != null && widget.fieldTitle != '')
          Row(
            children: [
              TextB(
                text: widget.fieldTitle!,
                textStyle: TextStyle(fontSize: widget.labelSize),
                fontColor: bBlack,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(width: 5),
            ],
          ),
        if (widget.fieldTitle != null && widget.fieldTitle != '')
          const SizedBox(height: 5),
        Container(
          child: TextField(
            obscuringCharacter: '●',
            readOnly: widget.isReadOnly,
            obscureText: widget.obscureText,
            style: widget.textStyle,
            keyboardType: widget.textInputType!,
            onTap: widget.onTouch,
            onChanged: (value) {
              widget.onChanged(value);
            },
            textInputAction: TextInputAction.next,
            cursorColor: bGray,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            controller: widget.controller,
            focusNode: widget.focusNode,
            textAlign: widget.textAlign!,
            decoration: InputDecoration(
              isDense: true,
              suffixIconConstraints: const BoxConstraints(
                minHeight: 15,
                minWidth: 16,
              ),
              counterText: widget.maxLength == null ? '' : null,
              border: UnderlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: widget.paddingWidth!,
                vertical: widget.paddingHeight!,
              ),
              suffixIcon:
                  (widget.loading && (widget.isReadOnly))
                      ? Container(
                        height: 15,
                        width: 16,
                        margin: const EdgeInsets.only(right: 12),
                        child: const CircularProgressIndicator(
                          color: bGray,
                          strokeWidth: 2,
                        ),
                      )
                      : widget.suffixIcon != null
                      ? Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: widget.suffixIcon,
                      )
                      : null,
              labelText: widget.labelText,
              labelStyle: TextStyle(
                color:
                    widget.focusNode.hasFocus ? bGray : const Color(0XFF989898),
                fontSize: 14,
              ),
              hintText: widget.hintText!,
              hintStyle: TextStyle(
                color: Color(0XFFD6D6D6),
                fontWeight: FontWeight.w400,
              ),
              fillColor: widget.bgColor ?? bWhite,
              filled: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: bPrimaryColor),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: bGray),
              ),
            ),
          ),
        ),
        if (widget.errorText != "")
          TextB(text: widget.errorText!, textStyle: bBase, fontColor: bRed),
      ],
    );
  }
}
