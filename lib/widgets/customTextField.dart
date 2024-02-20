import 'package:flutter/material.dart';

Widget customTextField(context,String labelText,IconData icon,TextEditingController textController){
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * 0.80,
    child: TextFormField(
      controller: textController,
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(icon)
          ),
        ),
  );
}