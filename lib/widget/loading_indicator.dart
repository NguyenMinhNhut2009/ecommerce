import 'package:ecommerce/const/colors.dart';
import 'package:flutter/material.dart';

Widget loadingIncator() {
  return const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(redColor),);
}
