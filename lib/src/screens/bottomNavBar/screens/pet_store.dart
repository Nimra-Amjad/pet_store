import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_store_app/src/components/core/app_assets.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/components/textfield/customTextField.dart';
import 'package:pet_store_app/src/components/widgets/petBuyAndSellContainer.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                CustomText(
                  text: "Pets Near You",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PetBuyAndSellContainer(
                          petName: "Siamese Cat",
                          petImage: AppAssets.cat1,
                          petAge: "4 months"),
                      PetBuyAndSellContainer(
                          petName: "Siamese Cat",
                          petImage: AppAssets.dog1,
                          petAge: "4 months"),
                      PetBuyAndSellContainer(
                          petName: "Siamese Cat",
                          petImage: AppAssets.cat1,
                          petAge: "4 months"),
                      PetBuyAndSellContainer(
                          petName: "Siamese Cat",
                          petImage: AppAssets.dog1,
                          petAge: "4 months")
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomText(
                  text: "Pets Food",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood1,
                          productName: "PEDIGREE 400G",
                          price: "4000",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood2,
                          productName: "PEDIGREE 400G",
                          price: "3000",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood3,
                          productName: "PEDIGREE 400G",
                          price: "2000",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood4,
                          productName: "PEDIGREE 400G",
                          price: "5000",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood5,
                          productName: "PEDIGREE 400G",
                          price: "4000",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood6,
                          productName: "PEDIGREE 400G",
                          price: "2000",
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
