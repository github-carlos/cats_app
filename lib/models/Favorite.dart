import 'package:cat_app/models/ImageCat.dart';

class Favorite {
  String createdAt;
  int id;
  ImageCat image;
  String imageId;
  String subId;
  String userId;

  Favorite(
      {this.createdAt,
        this.id,
        this.image,
        this.imageId,
        this.subId,
        this.userId});

  Favorite.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    image = json['image'] != null ? new ImageCat.fromJson(json['image']) : null;
    imageId = json['image_id'];
    subId = json['sub_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['image_id'] = this.imageId;
    data['sub_id'] = this.subId;
    data['user_id'] = this.userId;
    return data;
  }
}