import 'package:flutter/material.dart';
import 'package:pet_store_app/src/components/widgets/videosContainer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VideosScreen extends StatelessWidget {
  final int index;
  const VideosScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          VideosContainer(),
          SizedBox(
            height: 1.h,
          ),
          VideosContainer(),
          SizedBox(
            height: 1.h,
          ),
          VideosContainer(),
          SizedBox(
            height: 1.h,
          ),
          VideosContainer(),
        ],
      ),
    );
  }
}
