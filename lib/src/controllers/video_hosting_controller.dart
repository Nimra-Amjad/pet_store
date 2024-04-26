import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:pet_store_app/src/models/user_model.dart' as model;

class VideoHostingController extends GetxController {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  VideoPlayerController? videoPlayerController;
  final ImagePicker picker = ImagePicker();
  RxList feedList = [].obs;
  Rx<File> video = File('').obs;

  Future pickVideo() async {
    XFile? videoFile;
    try {
      videoFile = await picker.pickVideo(source: ImageSource.gallery);
      if (videoFile == null) {
        return;
      }
      final imageTemp = File(videoFile.path);
      video.value = imageTemp;

      videoPlayerController = VideoPlayerController.file(File(videoFile.path))
        ..initialize().then((value) {
          videoPlayerController!.play();
        });
    } on PlatformException catch (e) {
      return e;
    }
  }

  addVideo({required String title}) async {
    final random = Random().nextInt(999999).toString().padLeft(6, '0');
    Reference ref = storage.ref().child('videos/${DateTime.now()}.mp4');
    await ref.putFile(video.value);
    String downloadURL = await ref.getDownloadURL();
    model.Videos feed = model.Videos(
        postId: random,
        video: downloadURL,
        title: title,
        userUid: user!.uid,
        timeStamp: DateTime.now().toString());
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("videos")
        .doc(random)
        .set(feed.toJson());
  }

  void getVideoFeedList() async {
    if (user != null) {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collectionGroup('videos').get();

      List<model.Feeds> userFeeds = [];
      querySnapshot.docs.forEach((doc) {
        if (doc.exists) {
          var data = doc.data() as Map<String, dynamic>;
          model.Feeds feed = model.Feeds(
            postId: data['postId'],
            image: data['video'],
            title: data['title'],
            userUid: data['userUid'],
            timeStamp: data['timeStamp'],
          );
          userFeeds.add(feed);
        }
      });

      feedList.assignAll(userFeeds);
    }
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }
}
