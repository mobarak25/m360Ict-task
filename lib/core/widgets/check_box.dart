import 'package:bs_flutter_project_task/core/theme/colors.dart';
import 'package:bs_flutter_project_task/core/widgets/text.dart';
import 'package:flutter/material.dart';

class CheckboxB extends StatefulWidget {
  const CheckboxB({
    super.key,
    required this.label,
    required this.press,
    required this.defaultValue,
    this.fontSize,
    this.fontColor,
  });
  final String label;
  final Function press;
  final bool defaultValue;
  final double? fontSize;
  final Color? fontColor;

  @override
  State<CheckboxB> createState() => _CheckboxBState();
}

class _CheckboxBState extends State<CheckboxB> {
  bool _isChecked = true;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 22,
          height: 22,
          child: Theme(
            data: ThemeData(unselectedWidgetColor: bPrimaryColor),
            child: Checkbox(
              splashRadius: 0,
              activeColor: bPrimaryColor,
              value: _isChecked,
              onChanged: (bool? newValue) {
                setState(() {
                  _isChecked = newValue!;
                });
                widget.press(_isChecked);
              },
            ),
          ),
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
            });
            widget.press(_isChecked);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextB(
              text: widget.label,
              fontSize: widget.fontSize ?? 13,
              fontColor: widget.fontColor ?? bBlack,
            ),
          ),
        ),
      ],
    );
  }
}
