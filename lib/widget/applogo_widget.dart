import 'package:ecommerce/const/consts.dart';
import 'package:flutter/material.dart';

Widget appLogoWidget() {
//using veloity x here
  return Image.asset(icAppLogo)
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
