import 'package:flutter/material.dart';
import 'package:pet_store_app/src/components/button/customButton.dart';
import 'package:pet_store_app/src/components/core/app_assets.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/components/textfield/customTextField.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController expiryDateController = TextEditingController();
    final TextEditingController cvvController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryWhite,
          ),
        ),
        title: CustomText(
          text: "Checkout",
          fontWeight: FontWeight.bold,
          textColor: AppColors.primaryWhite,
          fontSize: 22.sp,
        ),
        elevation: 0,
        backgroundColor: const Color(0xff6ea7db),
      ),
      body: SafeArea(
        child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xf9ffffff),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 32.h,
                        decoration: const BoxDecoration(
                          color: Color(0xff6ea7db),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Payment Methods",
                                textColor: AppColors.primaryWhite,
                                fontWeight: FontWeight.bold,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    AppAssets.visaCard,
                                    width: 22.w,
                                    height: 7.h,
                                  ),
                                  Image.asset(
                                    AppAssets.easyPiasa,
                                    width: 22.w,
                                    height: 7.h,
                                  ),
                                  Image.asset(
                                    AppAssets.link,
                                    width: 22.w,
                                    height: 7.h,
                                  ),
                                  Image.asset(
                                    AppAssets.raast,
                                    width: 22.w,
                                    height: 7.h,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.sp),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Image.asset(AppAssets.card),
                            SizedBox(
                              height: 12.sp,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: "Name on Card",
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(
                              height: 6.sp,
                            ),
                            CustomTextFormField(
                              fillColor: Color.fromARGB(255, 150, 195, 187),
                              hintText: "",
                              labelText: "",
                              controller: nameController,
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: "Card Number",
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(
                              height: 6.sp,
                            ),
                            CustomTextFormField(
                              fillColor: Color.fromARGB(255, 150, 195, 187),
                              hintText: "",
                              labelText: "",
                              controller: cardNumberController,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 15.sp,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: "Expired Date",
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(
                              height: 6.sp,
                            ),
                            Row(
                              children: [
                                CustomTextFormField(
                                  fillColor: Color.fromARGB(255, 150, 195, 187),
                                  hintText: "",
                                  labelText: "",
                                  width: 20.w,
                                  controller: expiryDateController,
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(
                                  width: 12.sp,
                                ),
                                CustomTextFormField(
                                  fillColor: Color.fromARGB(255, 150, 195, 187),
                                  hintText: "",
                                  labelText: "",
                                  width: 20.w,
                                  controller: cvvController,
                                  keyboardType: TextInputType.number,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.sp,
                            ),
                            CustomButton(
                              text: "Pay",
                              voidCallback: () {},
                            ),
                            SizedBox(
                              height: 20.sp,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
