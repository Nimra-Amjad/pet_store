import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_store_app/src/models/user_model.dart' as model;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/bottomNavBar.dart';

class FeedsController extends GetxController {
  Rx<File> image = File('').obs;
  User? user = FirebaseAuth.instance.currentUser;
  RxList feedList = [].obs;
  RxList<model.CommentsOnFeed> comments = <model.CommentsOnFeed>[].obs;

  Future pickImage(ImageSource source) async {
    try {
      final imagePick = await ImagePicker().pickImage(source: source);
      if (imagePick == null) {
        return;
      }
      final imageTemp = File(imagePick.path);
      image.value = imageTemp;
    } on PlatformException catch (e) {
      return e;
    }
  }

  addPost({required String title}) async {
    final random = Random().nextInt(999999).toString().padLeft(6, '0');
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();

    Reference reference =
        FirebaseStorage.instance.ref().child('posts/$fileName.png');
    await reference.putFile(image.value);

    String downloadURL = await reference.getDownloadURL();
    model.Feeds feed = model.Feeds(
        postId: random,
        image: downloadURL,
        title: title,
        userUid: user!.uid,
        timeStamp: DateTime.now().toString());
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("feeds")
        .doc(random)
        .set(feed.toJson());
  }

  void addLikeOnPost(String userId, String postId, String userName) async {
    DocumentReference postRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('feeds')
        .doc(postId);

    DocumentSnapshot postDoc = await postRef.get();
    if (postDoc.exists) {
      var data = postDoc.data() as Map<String, dynamic>;
      List<dynamic> likes = data['likes'] ?? [];

      if (!likes.contains(userName)) {
        likes.add(userName);
        await postRef.update({'likes': likes});
      }
    }
  }

  void addCommentOnPost(
      String userId, String postId, String userName, String comment) async {
    // Get a reference to the post document
    DocumentReference postRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('feeds')
        .doc(postId);

    // Get the current data of the post
    DocumentSnapshot postDoc = await postRef.get();
    if (postDoc.exists) {
      var data = postDoc.data() as Map<String, dynamic>;
      List<dynamic> comments = data['comments'] ?? [];

      // Create a new comment object
      model.CommentsOnFeed newComment =
          model.CommentsOnFeed(name: userName, comment: comment);

      // Convert the comment object to JSON and add it to the list of comments
      comments.add(newComment.toJson());

      // Update the post document with the new comments list
      await postRef.update({'comments': comments});
    }
  }

  void getComments(String userId, String postId) async {
    // Get a reference to the post document
    DocumentReference postRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('feeds')
        .doc(postId);

    // Get the current data of the post
    DocumentSnapshot postDoc = await postRef.get();
    if (postDoc.exists) {
      comments.clear();
      var data = postDoc.data() as Map<String, dynamic>;
      List<dynamic> commentsData = data['comments'] ?? [];

      print(
          'Raw Comments Data: $commentsData'); // Debugging: Print raw comments data

      // Convert each comment data to a Comment object and add to the comments list
      commentsData.forEach((commentData) {
        model.CommentsOnFeed comment = model.CommentsOnFeed.fromJson(commentData);
        comments.add(comment);
      });

      print(
          'Processed Comments: $comments'); // Debugging: Print processed comments list
    }
  }

  void getFeedList() async {
    if (user != null) {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collectionGroup('feeds').get();

      List<model.Feeds> userFeeds = [];
      querySnapshot.docs.forEach((doc) {
        if (doc.exists) {
          var data = doc.data() as Map<String, dynamic>;
          model.Feeds feed = model.Feeds(
            postId: data['postId'],
            image: data['image'],
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

  void navigateToHomeScreen(BuildContext context) {
    Get.to(BottomNavBar());
  }
}
