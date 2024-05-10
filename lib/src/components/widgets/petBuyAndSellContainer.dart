import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pet_store_app/src/components/button/customButton.dart';
import 'package:pet_store_app/src/components/button/smallButton.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/controllers/cartController.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/checkOutScreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PetBuyAndSellContainer extends StatelessWidget {
  final String petName;
  final String petImage;
  final String petAge;
  const PetBuyAndSellContainer(
      {super.key,
      required this.petName,
      required this.petImage,
      required this.petAge});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      child: GestureDetector(
        onTap: () {
          cartController.reset();
          showCupertinoModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                children: [
                  Image.asset(
                    petImage,
                    height: 40.h,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomText(
                    text: petName,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: "Rs 14,000",
                    fontSize: 16.sp,
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
                    height: 4.h,
                  ),
                  CustomButton(
                    text: "Adopt Now",
                    voidCallback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckOutScreen()));
                    },
                    btnColor: AppColors.greenColor,
                  )
                ],
              ),
            ),
          );
        },
        child: Container(
          width: 50.w,
          height: 35.h,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 219, 245, 234),
              borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            children: [
              Image.asset(petImage),
              SizedBox(
                height: 1.h,
              ),
              Container(
                width: 45.w,
                decoration: BoxDecoration(
                    color: AppColors.primaryWhite,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.sp, vertical: 8.sp),
                      child: Column(
                        children: [
                          CustomText(
                            text: petName,
                            fontSize: 17.sp,
                          ),
                          CustomText(
                            text: "Age: $petAge",
                            fontSize: 15.sp,
                          )
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_upward)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}