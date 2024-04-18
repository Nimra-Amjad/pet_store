import 'package:flutter/material.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/drawer/drawerItem.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.gradientSplashBoxColor4,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 24.h,
              ),
              Positioned(
                top: 35,
                left: 24,
                child: Container(
                  height: 18.h,
                  width: 60.w,
                  color: AppColors.blackColor.withOpacity(0.8),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.sp),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Aaqil Ansari Sheikh",
                          textColor: AppColors.primaryWhite,
                        ),
                        CustomText(
                          text: "ansari@gmail.com",
                          textColor: AppColors.primaryWhite,
                          fontWeight: FontWeight.w300,
                        ),
                        CustomText(
                          text: "03480044786",
                          textColor: AppColors.primaryWhite,
                          fontWeight: FontWeight.w300,
                        ),
                        CustomText(
                          text: "Karachi",
                          textColor: AppColors.primaryWhite,
                          fontWeight: FontWeight.w300,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const DrawerItem(
            text: "Profile",
            icon: Icons.person_outline,
          ),
          const DrawerItem(
            text: "Add / Edit Pets",
            icon: Icons.edit_outlined,
          ),
          const DrawerItem(
            text: "Cart",
            icon: Icons.shopping_cart_outlined,
          ),
          const DrawerItem(
            text: "Pet History",
            icon: Icons.pets_sharp,
          ),
          const DrawerItem(
            text: "Logout",
            icon: Icons.logout_outlined,
          ),
        ],
      ),
    );
  }
}
