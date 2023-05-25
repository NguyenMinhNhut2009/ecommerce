import 'package:ecommerce/const/consts.dart';
import 'package:ecommerce/const/lists.dart';
import 'package:ecommerce/widget/our_button.dart';
import 'package:flutter/material.dart';

class ItemDdetails extends StatelessWidget {
  const ItemDdetails({super.key, required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
          title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: darkFontGrey,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                  color: darkFontGrey,
                )),
          ]),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //swipper section

                    VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      aspectRatio: 16 / 9,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                      itemCount: 3,
                    ),

                    10.heightBox,
                    title!.text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "\$30,00"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(28)
                        .make(),
                    10.heightBox,

                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "In House Brands"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          ],
                        )),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.message_rounded,
                            color: darkFontGrey,
                          ),
                        )
                      ],
                    )
                        .box
                        .height(60)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),

                    //color section
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                  3,
                                  (index) => VxBox()
                                      .size(30, 30)
                                      .roundedFull
                                      .color(Vx.randomPrimaryColor)
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 8))
                                      .make()),
                            )
                          ],
                        )
                            .box
                            .padding(const EdgeInsets.symmetric(horizontal: 8))
                            .make(),

                        //qutality row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Quantity ".text.color(textfieldGrey).make(),
                            ),
                            Row(children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove)),
                              "0 "
                                  .text
                                  .size(16)
                                  .color(darkFontGrey)
                                  .fontFamily(bold)
                                  .make(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add)),
                              10.widthBox,
                              "(0 available)".text.color(textfieldGrey).make(),
                            ]),
                          ],
                        )
                            .box
                            .padding(const EdgeInsets.symmetric(horizontal: 8))
                            .make(),

                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total ".text.color(textfieldGrey).make(),
                            ),
                            "\$0.00"
                                .text
                                .color(redColor)
                                .size(16)
                                .fontFamily(bold)
                                .make(),
                          ],
                        )
                            .box
                            .padding(const EdgeInsets.symmetric(horizontal: 8))
                            .make(),
                      ],
                    ).box.white.shadowSm.make(),

                    //description section

                    10.heightBox,
                    "Description"
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),

                    10.heightBox,
                    "This is a dummy item and dummy desciption here... "
                        .text
                        .color(darkFontGrey)
                        .make(),
                    //button section

                    10.heightBox,

                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          itemDetailButtonsList.length,
                          (index) => ListTile(
                                title: itemDetailButtonsList[index]
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: const Icon(Icons.arrow_forward),
                              )),
                    ),

                    20.heightBox,
                    productsyoumaylike.text
                        .fontFamily(bold)
                        .size(26)
                        .color(darkFontGrey)
                        .make(),

                    10.heightBox,

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            6,
                            (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      imgP1,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                    10.heightBox,
                                    "LapTop 4GB/64GB"
                                        .text
                                        .fontFamily(semibold)
                                        .color(darkFontGrey)
                                        .make(),
                                    10.heightBox,
                                    "\$600"
                                        .text
                                        .size(16)
                                        .fontFamily(bold)
                                        .color(redColor)
                                        .make(),
                                  ],
                                )
                                    .box
                                    .white
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .roundedSM
                                    .padding(const EdgeInsets.all(8))
                                    .make()),
                      ),
                    ),
                  ]),
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
                color: redColor,
                onpress: () {},
                textColor: whiteColor,
                title: "Add to cart"),
          ),
        ],
      ),
    );
  }
}
