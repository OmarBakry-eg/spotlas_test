// To parse this JSON data, do
//
//     final feedModel = feedModelFromJson(jsonString);

import 'dart:convert';

List<FeedModel> feedModelFromJson(String str) =>
    List<FeedModel>.from(json.decode(str).map((x) => FeedModel.fromJson(x)));

String feedModelToJson(List<FeedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedModel {
  FeedModel({
    this.id,
    this.createdAt,
    this.authorId,
    this.placeId,
    this.description,
    this.defaultPhotoUrl,
    this.defaultPhotoResolutions,
    this.placeholderLogo,
    this.userTags,
    this.feedModelTags,
    this.authorUsername,
    this.authorFullName,
    this.authorVerified,
    this.placeName,
    this.placeLocationName,
    this.placeLocationNameO,
    this.placeLocation,
    this.placePrimaryCategory,
    this.categoryDisplayName,
    this.placeLogoUrl,
    this.status,
    this.distance,
    this.authorPhotoUrl,
    this.photoUrls,
    this.photosResolutions,
    this.authorPhotosResolutions,
    this.isLiked,
    this.isBookmarked,
    this.isFollowing,
    this.numberOfComments,
    this.comments,
    this.numberOfLikes,
    this.likes,
    this.numberOfPhotos,
    this.blackBorder,
    this.address,
    this.imageSource,
    this.isGoogleSource,
    this.dayMode,
    this.isRecommendation,
    this.tags,
    this.categories,
    this.score,
    this.ratio,
  });

  String? id;
  String? authorId;
  String? placeId;
  String? description;
  String? defaultPhotoUrl;
  String? placeholderLogo;
  String? authorUsername;
  String? authorFullName;
  String? placeName;
  String? placeLocationName;
  String? placeLocationNameO;
  String? placePrimaryCategory;
  String? categoryDisplayName;
  String? placeLogoUrl;
  String? status;
  String? ratio;
  String? authorPhotoUrl;
  String? imageSource;
  List<String>? photoUrls;
  List<AuthorPhotosResolutions>? photosResolutions;
  AuthorPhotosResolutions? authorPhotosResolutions;
  AuthorPhotosResolutions? defaultPhotoResolutions;
  List<Comment>? comments;
  List<Like>? likes;
  Address? address;
  PlaceLocation? placeLocation;
  bool? isGoogleSource;
  bool? dayMode;
  bool? isRecommendation;
  bool? authorVerified;
  bool? isLiked;
  bool? isBookmarked;
  bool? isFollowing;
  bool? blackBorder;
  List<dynamic>? tags;
  List<dynamic>? categories;
  List<UserTag>? userTags;
  List<Tags>? feedModelTags;
  int? score;
  int? distance;
  int? numberOfPhotos;
  int? numberOfLikes;
  int? numberOfComments;
  DateTime? createdAt;

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        authorId: json["authorId"],
        placeId: json["placeId"],
        description: json["description"],
        defaultPhotoUrl: json["defaultPhotoUrl"],
        defaultPhotoResolutions:
            AuthorPhotosResolutions.fromJson(json["defaultPhotoResolutions"]),
        placeholderLogo: json["placeholder_logo"],
        userTags: List<UserTag>.from(json["userTags"].map((x) => UserTag.fromJson(x))),
        feedModelTags: List<Tags>.from(json["tags_"].map((x) => Tags.fromJson(x))),
        authorUsername: json["authorUsername"],
        authorFullName: json["authorFullName"],
        authorVerified: json["authorVerified"],
        placeName: json["placeName"],
        placeLocationName: json["placeLocationName"],
        placeLocationNameO: json["placeLocationNameO"],
        placeLocation: PlaceLocation.fromJson(json["placeLocation"]),
        placePrimaryCategory: json["placePrimaryCategory"],
        categoryDisplayName: json["categoryDisplayName"],
        placeLogoUrl: json["placeLogoUrl"],
        status: json["status"],
        distance: json["distance"],
        authorPhotoUrl: json["authorPhotoUrl"],
        photoUrls: List<String>.from(json["photoUrls"].map((x) => x)),
        photosResolutions: List<AuthorPhotosResolutions>.from(
            json["photosResolutions"].map((x) => AuthorPhotosResolutions.fromJson(x))),
        authorPhotosResolutions:
            AuthorPhotosResolutions.fromJson(json["authorPhotosResolutions"]),
        isLiked: json["isLiked"],
        isBookmarked: json["isBookmarked"],
        isFollowing: json["isFollowing"],
        numberOfComments: json["numberOfComments"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
        numberOfLikes: json["numberOfLikes"],
        likes: List<Like>.from(json["likes"].map((x) => Like.fromJson(x))),
        numberOfPhotos: json["numberOfPhotos"],
        blackBorder: json["blackBorder"],
        address: Address.fromJson(json["address"]),
        imageSource: json["imageSource"],
        isGoogleSource: json["isGoogleSource"],
        dayMode: json["dayMode"],
        isRecommendation: json["isRecommendation"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        score: json["score"],
        ratio: json["ratio"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "authorId": authorId,
        "placeId": placeId,
        "description": description,
        "defaultPhotoUrl": defaultPhotoUrl,
        "defaultPhotoResolutions": defaultPhotoResolutions?.toJson(),
        "placeholder_logo": placeholderLogo,
        "userTags": List<dynamic>.from(userTags!.map((x) => x.toJson())),
        "tags_": List<dynamic>.from(feedModelTags!.map((x) => x.toJson())),
        "authorUsername": authorUsername,
        "authorFullName": authorFullName,
        "authorVerified": authorVerified,
        "placeName": placeName,
        "placeLocationName": placeLocationName,
        "placeLocationNameO": placeLocationNameO,
        "placeLocation": placeLocation?.toJson(),
        "placePrimaryCategory": placePrimaryCategory,
        "categoryDisplayName": categoryDisplayName,
        "placeLogoUrl": placeLogoUrl,
        "status": status,
        "distance": distance,
        "authorPhotoUrl": authorPhotoUrl,
        "photoUrls": List<dynamic>.from(photoUrls!.map((x) => x)),
        "photosResolutions":
            List<dynamic>.from(photosResolutions!.map((x) => x.toJson())),
        "authorPhotosResolutions": authorPhotosResolutions?.toJson(),
        "isLiked": isLiked,
        "isBookmarked": isBookmarked,
        "isFollowing": isFollowing,
        "numberOfComments": numberOfComments,
        "comments": List<dynamic>.from(comments!.map((x) => x.toJson())),
        "numberOfLikes": numberOfLikes,
        "likes": List<dynamic>.from(likes!.map((x) => x.toJson())),
        "numberOfPhotos": numberOfPhotos,
        "blackBorder": blackBorder,
        "address": address?.toJson(),
        "imageSource": imageSource,
        "isGoogleSource": isGoogleSource,
        "dayMode": dayMode,
        "isRecommendation": isRecommendation,
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "score": score,
        "ratio": ratio,
      };
}

class Address {
  Address({
    this.line1,
    this.area,
    this.city,
    this.postcode,
    this.region,
    this.state,
    this.country,
  });

  String? line1;
  String? area;
  String? city;
  String? postcode;
  String? region;
  String? state;
  String? country;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        line1: json["line1"],
        area: json["area"],
        city: json["city"],
        postcode: json["postcode"],
        region: json["region"],
        state: json["state"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "line1": line1,
        "area": area,
        "city": city,
        "postcode": postcode,
        "region": region,
        "state": state,
        "country": country,
      };
}

class AuthorPhotosResolutions {
  AuthorPhotosResolutions({
    this.original,
    this.large,
    this.medium,
    this.small,
    this.markerWhite,
    this.markerPink,
    this.isGoogle,
  });

  String? original;
  String? large;
  String? medium;
  String? small;
  String? markerWhite;
  String? markerPink;
  bool? isGoogle;

  factory AuthorPhotosResolutions.fromJson(Map<String, dynamic> json) =>
      AuthorPhotosResolutions(
        original: json["original"],
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
        markerWhite: json["markerWhite"],
        markerPink: json["markerPink"],
        isGoogle: json["isGoogle"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
        "large": large,
        "medium": medium,
        "small": small,
        "markerWhite": markerWhite,
        "markerPink": markerPink,
        "isGoogle": isGoogle,
      };
}

class Comment {
  Comment({
    this.id,
    this.createdAt,
    this.recommendationId,
    this.parentCommentId,
    this.authorId,
    this.text,
    this.userTags,
    this.authorUsername,
    this.authorPhotoUrl,
    this.numberOfLikes,
    this.numberOfReplies,
    this.isLiked,
    this.replies,
  });

  String? recommendationId;
  String? parentCommentId;
  String? id;
  String? authorId;
  String? text;
  String? authorUsername;
  String? authorPhotoUrl;
  int? numberOfLikes;
  int? numberOfReplies;
  bool? isLiked;
  List<Comment>? replies;
  List<UserTag>? userTags;
  DateTime? createdAt;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        recommendationId: json["recommendationId"],
        parentCommentId: json["parentCommentId"],
        authorId: json["authorId"],
        text: json["text"],
        userTags: List<UserTag>.from(json["userTags"].map((x) => UserTag.fromJson(x))),
        authorUsername: json["authorUsername"],
        authorPhotoUrl: json["authorPhotoUrl"],
        numberOfLikes: json["numberOfLikes"],
        numberOfReplies: json["numberOfReplies"],
        isLiked: json["isLiked"],
        replies: json["replies"] == null
            ? null
            : List<Comment>.from(json["replies"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "recommendationId": recommendationId,
        "parentCommentId": parentCommentId,
        "authorId": authorId,
        "text": text,
        "userTags": List<dynamic>.from(userTags!.map((x) => x.toJson())),
        "authorUsername": authorUsername,
        "authorPhotoUrl": authorPhotoUrl,
        "numberOfLikes": numberOfLikes,
        "numberOfReplies": numberOfReplies,
        "isLiked": isLiked,
        "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
      };
}

class UserTag {
  UserTag({
    this.id,
    this.username,
  });

  String? id;
  String? username;

  factory UserTag.fromJson(Map<String, dynamic> json) => UserTag(
        id: json["id"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
      };
}

class Tags {
  Tags({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Like {
  Like({
    this.userId,
    this.entityId,
    this.createdAt,
    this.username,
    this.photoUrl,
    this.firstName,
    this.lastName,
    this.photoResolutions,
  });

  String? userId;
  String? entityId;
  String? username;
  String? photoUrl;
  String? firstName;
  String? lastName;
  DateTime? createdAt;
  AuthorPhotosResolutions? photoResolutions;

  factory Like.fromJson(Map<String, dynamic> json) => Like(
        userId: json["userId"],
        entityId: json["entityId"],
        createdAt: DateTime.parse(json["createdAt"]),
        username: json["username"],
        photoUrl: json["photoUrl"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        photoResolutions: AuthorPhotosResolutions.fromJson(json["photoResolutions"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "entityId": entityId,
        "createdAt": createdAt?.toIso8601String(),
        "username": username,
        "photoUrl": photoUrl,
        "firstName": firstName,
        "lastName": lastName,
        "photoResolutions": photoResolutions?.toJson(),
      };
}

class PlaceLocation {
  PlaceLocation({
    this.latitude,
    this.longitude,
  });

  double? latitude;
  double? longitude;

  factory PlaceLocation.fromJson(Map<String, dynamic> json) => PlaceLocation(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
