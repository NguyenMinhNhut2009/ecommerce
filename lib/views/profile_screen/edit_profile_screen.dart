import 'dart:io';

import 'package:ecommerce/const/consts.dart';
import 'package:ecommerce/controllers/profile_controller.dart';
import 'package:ecommerce/widget/bg_widget.dart';
import 'package:ecommerce/widget/custom_textflied.dart';
import 'package:ecommerce/widget/our_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : data['imageUrl'] != '' &&
                            controller.profileImgPath.isEmpty
                        ? Image.network(
                            data['imageUrl'],
                            fit: BoxFit.cover,
                            width: 100,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.file(
                            File(controller.profileImgPath.value),
                            fit: BoxFit.cover,
                            width: 100,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ourButton(
                    color: redColor,
                    onpress: () {
                      controller.changImage(context);
                    },
                    textColor: whiteColor,
                    title: "Change"),
                const Divider(),
                20.heightBox,
                CustomTextFeild(
                    titleHint: nameHint,
                    title: name,
                    isPass: false,
                    controller: controller.nameController),
                10.heightBox,
                CustomTextFeild(
                    titleHint: passwordHint,
                    title: oldpass,
                    isPass: true,
                    controller: controller.oldpasswordController),
                10.heightBox,
                CustomTextFeild(
                    titleHint: passwordHint,
                    title: newpass,
                    isPass: true,
                    controller: controller.newpasswordController),
                20.heightBox,
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : SizedBox(
                        width: context.screenWidth - 60,
                        child: ourButton(
                            color: redColor,
                            onpress: () async {
                              controller.isLoading(true);

                              if (controller.profileImgPath.value.isNotEmpty) {
                                await controller.uploadProfileImage();
                              } else {
                                controller.profileImgLink = data['imageUrl'];
                              }

                              if (data['password'] ==
                                  controller.oldpasswordController.text) {
                                await controller.chaneAuthPassword(
                                    email: data['email'],
                                    password:
                                        controller.oldpasswordController.text,
                                    newpassword:
                                        controller.newpasswordController.text);
                                await controller.updateProfile(
                                    imgUrl: controller.profileImgLink,
                                    name: controller.nameController.text,
                                    password:
                                        controller.newpasswordController.text);
                                // ignore: use_build_context_synchronously
                                VxToast.show(context, msg: "Update");
                              } else {
                                // ignore: use_build_context_synchronously
                                VxToast.show(context,
                                    msg: "Wrong old password");
                                controller.isLoading(false);
                              }
                            },
                            textColor: whiteColor,
                            title: "Save"),
                      ),
              ],
            )
                .box
                .white
                .shadowSm
                .padding(const EdgeInsets.all(16))
                .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
                .rounded
                .make(),
          ),
        ),
      ),
    );
  }
}
