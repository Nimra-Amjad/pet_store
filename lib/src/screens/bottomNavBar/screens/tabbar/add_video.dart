import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({super.key});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  String? videoUrl;
  VideoPlayerController? controller;

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  pickVideo() async {
    final picker = ImagePicker();
    XFile? videoFile;
    try {
      videoFile = await picker.pickVideo(source: ImageSource.gallery);
      return videoFile!.path;
    } catch (e) {
      print("Error picking video: $e");
    }
  }

  video() async {
    videoUrl = await pickVideo();
  }

  void initializeVideoPlayer() {
    controller = VideoPlayerController.file(File(videoUrl!))
      ..initialize().then((value) {
        setState(() {});
        controller!.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: videoUrl != null
            ? controller != null
                ? AspectRatio(
                    aspectRatio: controller!.value.aspectRatio,
                    child: VideoPlayer(controller!),
                  )
                : const CircularProgressIndicator()
            : const Text("No video selected"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          video();
        },
        child: const Icon(Icons.video_library),
      ),
    );
  }
}
