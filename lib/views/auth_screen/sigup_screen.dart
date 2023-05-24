import 'package:ecommerce/const/consts.dart';

import 'package:ecommerce/widget/applogo_widget.dart';
import 'package:ecommerce/widget/bg_widget.dart';
import 'package:ecommerce/widget/custom_textflied.dart';
import 'package:ecommerce/widget/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigUpScreen extends StatefulWidget {
  const SigUpScreen({super.key});

  @override
  State<SigUpScreen> createState() => _SigUpScreenState();
}

class _SigUpScreenState extends State<SigUpScreen> {
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Join the $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Column(
              children: [
                CustomTextFeild(title: name, titleHint: nameHint),
                CustomTextFeild(title: email, titleHint: emailHint),
                CustomTextFeild(title: password, titleHint: passwordHint),
                CustomTextFeild(title: retyePassword, titleHint: passwordHint),
                Row(
                  children: [
                    Checkbox(
                        activeColor: redColor,
                        checkColor: whiteColor,
                        value: isCheck,
                        onChanged: (vaule) {
                          setState(() {
                            isCheck = vaule;
                          });
                        }),
                    10.widthBox,
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                  fontFamily: regular, color: fontGrey),
                            ),
                            TextSpan(
                              text: ternAndCond,
                              style: TextStyle(
                                  fontFamily: regular, color: redColor),
                            ),
                            TextSpan(
                              text: "& ",
                              style: TextStyle(
                                  fontFamily: regular, color: fontGrey),
                            ),
                            TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                  fontFamily: regular, color: redColor),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                5.heightBox,
                ourButton(
                        color: isCheck == true ? redColor : lightGrey,
                        title: signup,
                        textColor: isCheck == true ? whiteColor : redColor,
                        onpress: () {})
                    .box
                    .width(context.screenWidth - 50)
                    .make(),
                10.heightBox,

                //wrappiong into gesture detector of velocity X
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: alreadyHaveAccount,
                        style: TextStyle(fontFamily: bold, color: fontGrey),
                      ),
                      TextSpan(
                        text: login,
                        style: TextStyle(fontFamily: bold, color: redColor),
                      ),
                    ],
                  ),
                ).onTap(() {
                  Get.back();
                }),
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ],
        )),
      ),
    );
  }
}
