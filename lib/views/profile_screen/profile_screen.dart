import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/const/consts.dart';
import 'package:ecommerce/const/images.dart';
import 'package:ecommerce/const/lists.dart';
import 'package:ecommerce/controllers/auth_controller.dart';
import 'package:ecommerce/controllers/profile_controller.dart';
import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/views/auth_screen/login_screen.dart';
import 'package:ecommerce/views/profile_screen/copoments/details_cart.dart';
import 'package:ecommerce/views/profile_screen/edit_profile_screen.dart';
import 'package:ecommerce/widget/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
        child: Scaffold(
            body: StreamBuilder(
      stream: FirestoreServices.getUSer(currentUser!.uid),
      builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(redColor),
            ),
          );
        } else {
          var data = snapshot.data!.docs[0];
          return SafeArea(
            child: Column(children: [
              //edit profile button

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.edit,
                    color: whiteColor,
                  ),
                ).onTap(
                  () {
                    controller.nameController.text = data['name'];
                    // controller.passwordController.text = data['password'];
                    Get.to(() => EditProfileScreen(
                          data: data,
                        ));
                  },
                ),
              ),

              //users details section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    data['imageUrl'] == ''
                        ? Image.asset(
                            imgProfile2,
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.network(
                            data['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "${data['name']}"
                            .text
                            .fontFamily(semibold)
                            .white
                            .make(),
                        "${data['email']}".text.white.make(),
                      ],
                    )),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: whiteColor),
                        ),
                        onPressed: () async {
                          await Get.put(AuthController())
                              .signoutMethod(context);
                          Get.offAll(() => const LoginScreen());
                        },
                        child: logout.text.fontFamily(semibold).white.make()),
                  ],
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(
                      count: "${data['cart_count']}",
                      title: "in your cart",
                      width: context.screenWidth / 3.5),
                  detailsCard(
                      count: "${data['wishlist_count']}",
                      title: "in your wishlist",
                      width: context.screenWidth / 3.5),
                  detailsCard(
                      count: "${data['order_count']}",
                      title: "your orders",
                      width: context.screenWidth / 3.5),
                ],
              ),

              40.heightBox,

              ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return ListTile(
                    leading: Image.asset(
                      profileButtonsIcon[index],
                      width: 22,
                    ),
                    title: profileButtonList[index]
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                  );
                }),
                separatorBuilder: ((context, index) {
                  return const Divider(
                    color: lightGrey,
                  );
                }),
                itemCount: profileButtonList.length,
              )
                  .box
                  .white
                  .rounded
                  .margin(const EdgeInsets.all(12))
                  .padding(const EdgeInsets.all(16))
                  .shadowSm
                  .make(),
            ]),
          );
        }
      }),
    )));
  }
}
