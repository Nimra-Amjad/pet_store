import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pet_store_app/src/components/core/app_assets.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/controllers/auth_controller.dart';
import 'package:pet_store_app/src/controllers/video_hosting_controller.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/tabbar/add_video.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final VideoHostingController controller = Get.put(VideoHostingController());
    final AuthController authController = Get.put(AuthController());
    controller.getVideoFeedList();
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddVideo()));
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
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.feedList.length,
                  itemBuilder: (context, index) {
                    String title = controller.feedList[index].title;
                    String video = controller.feedList[index].video;
                    String userId = controller.feedList[index].userUid;
                    String postId = controller.feedList[index].postId;

                    return FutureBuilder<String?>(
                      future: authController.getUserName(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          String? userName = snapshot.data;
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                  AppAssets.petStore,
                                  width: 45.w,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 45.w,
                                    child: CustomText(
                                      text:
                                          "Try not to laugh Dogs and cats best funniest animal videos 2023",
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  CustomText(
                                    text: "456K views",
                                    fontSize: 14.sp,
                                  ),
                                  CustomText(
                                    text: "1 month ago",
                                    fontSize: 14.sp,
                                  ),
                                ],
                              )
                            ],
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
