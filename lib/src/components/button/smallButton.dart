import 'package:flutter/material.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final VoidCallback voidCallback;
  const SmallButton(
      {super.key, required this.text, required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.backgroundDarkBlue),
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: CustomText(
            text: text,
            fontSize: 18.sp,
            textColor: AppColors.primaryWhite,
          ),
        ),
      ),
    );
  }
}
