import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pet_store_app/src/components/button/smallButton.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/controllers/cartController.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShopPetFoodContainer extends StatelessWidget {
  final String image;
  final String productName;
  final String price;
  const ShopPetFoodContainer(
      {super.key,
      required this.image,
      required this.productName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return InkWell(
      onTap: () {
        cartController.reset();
        showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      image,
                      width: 15.w,
                      height: 15.h,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: productName,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: price,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.primaryGrey,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomText(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  fontSize: 16.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          image,
                          width: 8.w,
                          height: 8.h,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        CustomText(
                          text: productName,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              cartController.increment();
                            },
                            icon: const Icon(Icons.add,
                                color: AppColors.greenColor)),
                        SizedBox(
                          width: 1.w,
                        ),
                        Obx(
                          () => CustomText(
                            text: cartController.product.toString(),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            textColor: AppColors.primaryGrey,
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        IconButton(
                            onPressed: () {
                              cartController.decrement();
                            },
                            icon: const Icon(Icons.remove,
                                color: AppColors.greenColor)),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                cartController.product == 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SmallButton(text: "Add To Cart", voidCallback: () {}),
                          SmallButton(text: "Buy Now", voidCallback: () {})
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: AppColors.textfieldBlue)),
            child: Image.asset(
              image,
              width: 15.w,
              height: 15.h,
            ),
          ),
          SizedBox(
            height: 5.sp,
          ),
          CustomText(
            text: productName,
            fontSize: 15.sp,
          ),
          CustomText(
            text: price,
            fontSize: 15.sp,
          )
        ],
      ),
    );
  }
}
