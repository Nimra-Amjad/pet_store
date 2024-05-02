import 'package:flutter/material.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShopPetFoodContainer extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback voidCallback;
  const ShopPetFoodContainer(
      {super.key,
      required this.image,
      required this.text,
      required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Column(
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
            text: text,
            fontSize: 15.sp,
          )
        ],
      ),
    );
  }
}
