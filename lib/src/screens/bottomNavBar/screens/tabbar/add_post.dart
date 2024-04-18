import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_store_app/src/components/button/customButton.dart';
import 'package:pet_store_app/src/components/button/smallButton.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/controllers/feeds_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedsController controller = Get.put(FeedsController());
    final TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Add New Post",
          fontSize: 16.sp,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: SmallButton(
                    text: "Post",
                    voidCallback: () {
                      controller.addPost(
                          title: textController.text);
                    },
                  )),
              TextField(
                controller: textController,
                maxLines: controller.image.value.path == '' ? 5 : 1,
                decoration: InputDecoration(
                  hintText: "What's on your mind",
                  hintStyle:
                      TextStyle(fontSize: 18.sp, color: AppColors.primaryGrey),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.transparent),
                      borderRadius: BorderRadius.circular(12.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.transparent),
                      borderRadius: BorderRadius.circular(12.0)),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.transparent),
                      borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 20.h,
                child: controller.image.value.path == ''
                    ? Icon(Icons.camera)
                    : Image.file(File(controller.image.value.path)),
              )
            ],
          ),
        );
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
              text: "Select From Gallery",
              voidCallback: () {
                controller.pickImage(ImageSource.gallery);
              }),
          SizedBox(
            height: 1.h,
          ),
          CustomButton(
              text: "Select From Camera",
              voidCallback: () {
                controller.pickImage(ImageSource.camera);
              })
        ],
      ),
    );
  }
}
