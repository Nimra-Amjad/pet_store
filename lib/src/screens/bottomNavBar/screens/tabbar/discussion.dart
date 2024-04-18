import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/controllers/auth_controller.dart';
import 'package:pet_store_app/src/controllers/feeds_controller.dart';
import 'package:pet_store_app/src/models/user_model.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/tabbar/add_comment.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/tabbar/add_post.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DiscussionScreen extends StatelessWidget {
  final int index;
  const DiscussionScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FeedsController controller = Get.put(FeedsController());
    final AuthController authController = Get.put(AuthController());
    controller.getFeedList();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: "All Feeds"),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPost()));
                },
                child: Container(
                  width: 10.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.lightGrey),
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemCount: controller.feedList.length,
                itemBuilder: (context, index) {
                  String title = controller.feedList[index].title;
                  String imageUrl = controller.feedList[index].image;
                  String userId = controller.feedList[index].userUid;
                  String postId = controller.feedList[index].postId;

                  return FutureBuilder<String?>(
                    future: authController.getUserName(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        String? userName = snapshot.data;
                        return Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person),
                                CustomText(text: "Nimra Amjad"),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            imageUrl.isNotEmpty
                                ? SizedBox(
                                    width: double.infinity,
                                    height: 20.h,
                                    child: Image.network(
                                      imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : SizedBox(
                                    height: 1.h,
                                  ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.thumb_up),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    CustomText(
                                      text: "Like",
                                      fontSize: 15.sp,
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AddComment(
                                                userId: userId,
                                                postId: postId)));
                                    controller.getComments(userId, postId);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.comment),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      CustomText(
                                        text: "Comment",
                                        fontSize: 15.sp,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
