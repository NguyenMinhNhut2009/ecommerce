import 'package:ecommerce/const/consts.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget CustomTextFeild({String? title, String? titleHint, controller, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
            hintText: titleHint,
            hintStyle: const TextStyle(fontFamily: semibold, color: textfieldGrey),
            isDense: true,
            filled: true,
            fillColor: lightGrey,
            border: InputBorder.none,
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide(color: redColor))),
      ),
      5.heightBox,
    ],
  );
}
