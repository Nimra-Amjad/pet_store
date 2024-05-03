import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pet_store_app/src/components/button/smallButton.dart';
import 'package:pet_store_app/src/components/core/app_assets.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/components/textfield/customTextField.dart';
import 'package:pet_store_app/src/components/widgets/shopPetFoodcontainer.dart';
import 'package:pet_store_app/src/components/widgets/topHeadingContainer.dart';
import 'package:pet_store_app/src/controllers/cartController.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PetStoreScreen extends StatelessWidget {
  const PetStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    final CartController cartController = Get.put(CartController());

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
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood1,
                          productName: "PEDIGREE 400G",
                          price: "Rs 4000",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood2,
                          productName: "PEDIGREE 400G",
                          price: "Rs 3000",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood3,
                          productName: "PEDIGREE 400G",
                          price: "Rs 2000",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood4,
                          productName: "PEDIGREE 400G",
                          price: "Rs 5000",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood5,
                          productName: "PEDIGREE 400G",
                          price: "Rs 4000",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood6,
                          productName: "PEDIGREE 400G",
                          price: "Rs 2000",
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
