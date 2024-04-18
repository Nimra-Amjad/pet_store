import 'package:flutter/material.dart';
import 'package:pet_store_app/src/components/core/app_assets.dart';
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
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFormField(
                    hintText: "Search Item",
                    labelText: "Search Item",
                    suffixIcon: Icons.search,
                    controller: searchController),
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
                          text: "PEDIGREE 400G\n4000 PKR",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood1,
                          text: "PEDIGREE 400G\n4000 PKR",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood1,
                          text: "PEDIGREE 400G\n4000 PKR",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood1,
                          text: "PEDIGREE 400G\n4000 PKR",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood1,
                          text: "PEDIGREE 400G\n4000 PKR",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ShopPetFoodContainer(
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