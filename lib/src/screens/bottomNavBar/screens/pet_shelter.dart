import 'package:flutter/material.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/textfield/customTextField.dart';
import 'package:pet_store_app/src/components/widgets/shelterContainer.dart';
import 'package:pet_store_app/src/components/widgets/topHeadingContainer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PetShelterScreen extends StatelessWidget {
  const PetShelterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        children: [
          const TopHeadingContainer(text: "SHELTER AND HOSPITALS DETAILS"),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFormField(
                    hintText: "Search",
                    labelText: "Search",
                    suffixIcon: Icons.search,
                    fillColor: AppColors.lightGrey,
                    controller: searchController),
                SizedBox(
                  height: 2.h,
                ),
                const ShelterContainer(
                    contactNo: "876756654546", address: "Gulshan Phase 8"),
                SizedBox(
                  height: 2.h,
                ),
                const ShelterContainer(
                    contactNo: "876756654546", address: "Gulshan Phase 8"),
                SizedBox(
                  height: 2.h,
                ),
                const ShelterContainer(
                    contactNo: "876756654546", address: "Gulshan Phase 8"),
                SizedBox(
                  height: 2.h,
                ),
                const ShelterContainer(
                    contactNo: "876756654546", address: "Gulshan Phase 8")
              ],
            ),
          ))
        ],
      ),
    );
  }
}
