import 'package:cloud_firestore/cloud_firestore.dart';

///<-------------------------------User Model--------------------------------->
class User {
  String? uid;
  String? username;
  String? email;
  String? age;
  String? address;
  String? mobileno;
  bool? likedPost;

  User(
      {this.uid,
      this.username,
      this.email,
      this.age,
      this.address,
      this.mobileno,
      this.likedPost});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      uid: snapshot["uid"],
      username: snapshot["username"],
      email: snapshot["email"],
      age: snapshot["age"],
      address: snapshot["address"],
      mobileno: snapshot["mobileno"],
      likedPost: snapshot["likedPost"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "age": age,
        "address": address,
        "mobileno": mobileno,
        "likedPost": likedPost,
      };
}

///<-------------------------------Feeds Model--------------------------------->

class Feeds {
  final String? userUid;
  final String? postId;
  final String? image;
  final String? title;
  final String? timeStamp;
  List<dynamic>? likes;
  List<dynamic>? comments;

  Feeds(
      {this.userUid,
      this.postId,
      this.image,
      this.title,
      this.timeStamp,
      this.likes,
      this.comments});

  static Feeds fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Feeds(
        userUid: snapshot['userUid'],
        postId: snapshot['postId'],
        image: snapshot['image'],
        title: snapshot['title'],
        timeStamp: snapshot['timeStamp'],
        likes: snapshot['likes'],
        comments: snapshot['comments']);
  }

  Map<String, dynamic> toJson() => {
        "userUid": userUid,
        "postId": postId,
        "image": image,
        "title": title,
        "timeStamp": timeStamp,
        "likes": likes,
        "comments": comments,
      };
}

///<-------------------------------LikesOnFeed Model--------------------------------->

class LikesOnFeed {
  final String? name;

  LikesOnFeed({
    this.name,
  });

  static LikesOnFeed fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return LikesOnFeed(
      name: snapshot['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

///<-------------------------------CommentsOnFeed Model--------------------------------->

class CommentsOnFeed {
  final String? name;
  final String? comment;

  CommentsOnFeed({this.name, this.comment});

  factory CommentsOnFeed.fromJson(Map<String, dynamic> json) {
    return CommentsOnFeed(
      name: json['name'] ?? '',
      comment: json['comment'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {"name": name, "comment": comment};
}

///<-------------------------------Videos Model--------------------------------->

class Videos {
  final String? userUid;
  final String? postId;
  final String? video;
  final String? title;
  final String? timeStamp;
  List<dynamic>? likes;
  List<dynamic>? comments;

  Videos(
      {this.userUid,
      this.postId,
      this.video,
      this.title,
      this.timeStamp,
      this.likes,
      this.comments});

  static Videos fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Videos(
        userUid: snapshot['userUid'],
        postId: snapshot['postId'],
        video: snapshot['video'],
        title: snapshot['title'],
        timeStamp: snapshot['timeStamp'],
        likes: snapshot['likes'],
        comments: snapshot['comments']);
  }

  Map<String, dynamic> toJson() => {
        "userUid": userUid,
        "postId": postId,
        "video": video,
        "title": title,
        "timeStamp": timeStamp,
        "likes": likes,
        "comments": comments,
      };
}

///<-------------------------------LikesOnVideo Model--------------------------------->

class LikesOnVideo {
  final String? name;

  LikesOnVideo({
    this.name,
  });

  static LikesOnVideo fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return LikesOnVideo(
      name: snapshot['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

///<-------------------------------CommentsOnVideo Model--------------------------------->

class CommentsOnVideo {
  final String? name;
  final String? comment;

  CommentsOnVideo({this.name, this.comment});

  factory CommentsOnVideo.fromJson(Map<String, dynamic> json) {
    return CommentsOnVideo(
      name: json['name'] ?? '',
      comment: json['comment'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {"name": name, "comment": comment};
}
