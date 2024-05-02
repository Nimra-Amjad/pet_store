import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pet_store_app/src/components/button/smallButton.dart';
import 'package:pet_store_app/src/components/core/app_assets.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/components/textfield/customTextField.dart';
import 'package:pet_store_app/src/components/widgets/shopPetFoodcontainer.dart';
import 'package:pet_store_app/src/components/widgets/topHeadingContainer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PetStoreScreen extends StatelessWidget {
  const PetStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        children: [
          const TopHeadingContainer(text: "PET STORE"),
          SizedBox(
            height: 2.h,
          ),
          CustomTextFormField(
              hintText: "Search Item",
              labelText: "Search Item",
              suffixIcon: Icons.search,
              fillColor: AppColors.lightGrey,
              controller: searchController),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(AppAssets.petStore),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ShopPetFoodContainer(
                          voidCallback: () {
                            showCupertinoModalBottomSheet(
                              context: context,
                              builder: (context) => Padding(
                                padding: EdgeInsets.all(16.sp),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          AppAssets.petFood1,
                                          width: 15.w,
                                          height: 15.h,
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const CustomText(
                                              text: "PEDIGREE",
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CustomText(
                                              text: "PKR 4,000",
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SmallButton(
                                            text: "Add To Cart",
                                            voidCallback: () {}),
                                        SmallButton(
                                            text: "Buy Now",
                                            voidCallback: () {})
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    
                                  ],
                                ),
                              ),
                            );
                          },
                          image: AppAssets.petFood1,
                          text: "PEDIGREE 400G\n4000 PKR",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ShopPetFoodContainer(
                          voidCallback: () {},
                          image: AppAssets.petFood1,
                          text: "PEDIGREE 400G\n4000 PKR",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ShopPetFoodContainer(
                          voidCallback: () {},
                          image: AppAssets.petFood1,
                          text: "PEDIGREE 400G\n4000 PKR",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ShopPetFoodContainer(
                          voidCallback: () {},
                          image: AppAssets.petFood1,
                          text: "PEDIGREE 400G\n4000 PKR",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ShopPetFoodContainer(
                          voidCallback: () {},
                          image: AppAssets.petFood1,
                          text: "PEDIGREE 400G\n4000 PKR",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ShopPetFoodContainer(
                          voidCallback: () {},
                          image: AppAssets.petFood1,
                          text: "PEDIGREE 400G\n4000 PKR",
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
