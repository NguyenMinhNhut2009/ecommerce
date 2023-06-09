import 'package:ecommerce/const/consts.dart';
import 'package:ecommerce/const/lists.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/views/auth_screen/sigup_screen.dart';
import 'package:ecommerce/views/home_screen/home.dart';
import 'package:ecommerce/widget/applogo_widget.dart';
import 'package:ecommerce/widget/bg_widget.dart';
import 'package:ecommerce/widget/custom_textflied.dart';
import 'package:ecommerce/widget/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Obx(
              () => Column(
                children: [
                  CustomTextFeild(
                      title: email,
                      titleHint: emailHint,
                      isPass: false,
                      controller: controller.emailController),
                  CustomTextFeild(
                      title: password,
                      titleHint: passwordHint,
                      isPass: true,
                      controller: controller.passwordController),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () async {
                        await controller
                            .loginMethod(context: context)
                            .then((value) {
                          if (value != null) {
                            VxToast.show(context, msg: loggedin);
                            Get.offAll(() => const Home());
                          }
                        });
                      },
                      child: forgetPass.text.make(),
                    ),
                  ),
                  5.heightBox,
                  controller.isLoadding.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : ourButton(
                          color: redColor,
                          title: login,
                          textColor: whiteColor,
                          onpress: () async {
                            controller.isLoadding(true);
                            await controller
                                .loginMethod(context: context)
                                .then((value) {
                              if (value != null) {
                                VxToast.show(context, msg: loggedin);
                                Get.offAll(() => const Home());
                              } else {
                                controller.isLoadding(false);
                              }
                            });
                          }).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                      color: lightGolden,
                      title: signup,
                      textColor: redColor,
                      onpress: () {
                        Get.to(() => const SigUpScreen());
                      }).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: lightGrey,
                                radius: 25,
                                child: Image.asset(
                                  socialIconList[index],
                                  width: 30,
                                ),
                              ),
                            )),
                  )
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
