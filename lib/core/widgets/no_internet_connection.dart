import 'package:bs_flutter_project_task/core/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:bs_flutter_project_task/core/navigator/iflutter_navigator.dart';

Future showNoInternetConnection(
  IFlutterNavigator navigator, {
  required Function dismiss,
}) {
  return showDialog(
    context: navigator.context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(10),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  navigator.pop();
                  dismiss(true);
                },
                child: const Icon(Icons.close, color: Colors.red),
              ),
            ),
            const SizedBox(height: 10),
            TextB(text: "Phone is not connected to internet"),
          ],
        ),
      );
    },
  );
}
