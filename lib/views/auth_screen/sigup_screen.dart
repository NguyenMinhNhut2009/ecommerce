import 'package:ecommerce/const/consts.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/views/home_screen/home.dart';

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
  var controller = Get.put(AuthController());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

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
            Obx(
              () => Column(
                children: [
                  CustomTextFeild(
                      title: name,
                      titleHint: nameHint,
                      controller: nameController,
                      isPass: false),
                  CustomTextFeild(
                      title: email,
                      titleHint: emailHint,
                      controller: emailController,
                      isPass: false),
                  CustomTextFeild(
                      title: password,
                      titleHint: passwordHint,
                      controller: passwordController,
                      isPass: true),
                  CustomTextFeild(
                      title: retyePassword,
                      titleHint: passwordHint,
                      controller: passwordRetypeController,
                      isPass: true),
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
                  controller.isLoadding.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : ourButton(
                          color: isCheck == true ? redColor : lightGrey,
                          title: signup,
                          textColor: isCheck == true ? whiteColor : redColor,
                          onpress: () async {
                            if (isCheck != false) {
                              controller.isLoadding(true);
                              try {
                                await controller
                                    .signUpMethod(
                                        context: context,
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((value) {
                                  return controller.storeData(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text);
                                }).then((value) {
                                  VxToast.show(context, msg: loggedin);
                                  Get.offAll(
                                    () => Home,
                                  );
                                });
                              } catch (e) {
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());
                                controller.isLoadding(false);
                              }
                            }
                          },
                        ).box.width(context.screenWidth - 50).make(),
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
            ),
          ],
        )),
      ),
    );
  }
}
