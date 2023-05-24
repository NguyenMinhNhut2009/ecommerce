import 'package:ecommerce/const/consts.dart';
import 'package:flutter/material.dart';

Widget homeBottuns({width, height, icon, String? title, onPress}) {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(
      icon,
      width: 26,
    ),
    10.heightBox,
    title!.text.fontFamily(semibold).color(darkFontGrey).make()
  ]).box.rounded.white.size(width, height).shadowSm.make();
}
