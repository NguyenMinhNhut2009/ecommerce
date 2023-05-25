import 'package:ecommerce/const/consts.dart';
import 'package:ecommerce/const/images.dart';
import 'package:ecommerce/const/lists.dart';
import 'package:ecommerce/views/profile_screen/copoments/details_cart.dart';
import 'package:ecommerce/widget/bg_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: SafeArea(
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
            () {},
          ),
        ),

        //users details section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Image.asset(
                imgProfile2,
                width: 100,
                fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.widthBox,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Nhut Nguyen".text.fontFamily(semibold).white.make(),
                  "nhutxngm@gmail.com".text.white.make(),
                ],
              )),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: whiteColor),
                  ),
                  onPressed: () {},
                  child: logout.text.fontFamily(semibold).white.make()),
            ],
          ),
        ),
        20.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            detailsCard(
                count: "00",
                title: "in your cart",
                width: context.screenWidth / 3.5),
            detailsCard(
                count: "22",
                title: "in your wishlist",
                width: context.screenWidth / 3.5),
            detailsCard(
                count: "3036",
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
      ])),
    ));
  }
}
