import 'dart:convert';

import 'package:cat_app/configs/api_configs.dart';
import 'package:cat_app/models/Breed.dart';
import 'package:cat_app/models/Category.dart';
import 'package:cat_app/models/ImageCat.dart';
import 'package:http/http.dart' as http;

class CatsApi {
   // this api key must be get from the api cats https://thecatapi.com/
   final apiKey = ApiConfigs.apiKey;
   final baseUrl = 'https://api.thecatapi.com/v1';

  Future<List<Breed>> getBreeds() async {
    final breedsFromApi = await http.get('$baseUrl/breeds', headers: {'x-api-key': apiKey});
    List<dynamic> decodedJson = jsonDecode(breedsFromApi.body);
    var breedsList = decodedJson.map((e) => Breed.fromJson(e)).toList();
    return breedsList;
  }

  Future<List<Category>> getCategories() async {
    final categoriesFromApi = await http.get('$baseUrl/categories', headers: {'x-api-key': apiKey});
    List<dynamic> decodedJson = jsonDecode(categoriesFromApi.body);
    var categoriesList = decodedJson.map((e) => Category.fromJson(e)).toList();
    return categoriesList;
  }

  Future<List<ImageCat>> getRandomImages(int page) async {
    final imagesCatsFromApi = await http.get('$baseUrl/images/search?page=$page&limit=10', headers: {'x-api-key': apiKey});
    List<dynamic> decodedJson = jsonDecode(imagesCatsFromApi.body);
    var imagesCatsLists = decodedJson.map((e) => ImageCat.fromJson(e)).toList();
    return imagesCatsLists;
  }
}