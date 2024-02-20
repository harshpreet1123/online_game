import 'package:flutter/material.dart';

Widget customButton(
    {required BuildContext context,
    required Color buttonColor,
    required String text,
    required Color textColor,
    required VoidCallback onTap}) {
  return Center(
    child: Container(
      width: MediaQuery.sizeOf(context).width * 0.80,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: buttonColor),
      child: TextButton(
        onPressed: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ),
  );
}
