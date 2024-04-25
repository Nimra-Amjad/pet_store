import 'package:flutter/material.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/components/widgets/videosContainer.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/tabbar/add_video.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 12.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(text: "All Videos"),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddVideo()));
                  },
                  child: Container(
                    width: 10.w,
                    height: 5.h,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.lightGrey),
                    child: const Icon(Icons.add),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                const VideosContainer(),
                SizedBox(
                  height: 1.h,
                ),
                const VideosContainer(),
                SizedBox(
                  height: 1.h,
                ),
                const VideosContainer(),
                SizedBox(
                  height: 1.h,
                ),
                const VideosContainer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
