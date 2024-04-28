import 'package:flutter/material.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/drawer/drawerItem.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/add_shelter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lightGreenColor,
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: AppColors.greenColor.withOpacity(0.8),
                  ),
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
          DrawerItem(
            voidCallback: () {},
            text: "Profile",
            icon: Icons.person_outline,
          ),
          DrawerItem(
            voidCallback: () {},
            text: "Add / Edit Pets",
            icon: Icons.edit_outlined,
          ),
          DrawerItem(
            voidCallback: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddShelter()));
            },
            text: "Add Shelter",
            icon: Icons.edit_outlined,
          ),
          DrawerItem(
            voidCallback: () {},
            text: "Cart",
            icon: Icons.shopping_cart_outlined,
          ),
          DrawerItem(
            voidCallback: () {},
            text: "Pet History",
            icon: Icons.pets_sharp,
          ),
          DrawerItem(
            voidCallback: () {},
            text: "Logout",
            icon: Icons.logout_outlined,
          ),
        ],
      ),
    );
  }
}
