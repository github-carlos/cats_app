import 'package:cat_app/models/Breed.dart';

class ImageCat {
  List<Breed> breeds;
  int height;
  String id;
  String url;
  int width;

  ImageCat({this.breeds, this.height, this.id, this.url, this.width});

  ImageCat.fromJson(Map<String, dynamic> json) {
    if (json['breeds'] != null) {
      breeds = new List<Breed>();
      json['breeds'].forEach((v) {
        breeds.add(new Breed.fromJson(v));
      });
    }
    height = json['height'];
    id = json['id'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.breeds != null) {
      data['breeds'] = this.breeds.map((v) => v.toJson()).toList();
    }
    data['height'] = this.height;
    data['id'] = this.id;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}