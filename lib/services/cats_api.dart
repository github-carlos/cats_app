import 'dart:convert';
import 'dart:ffi';

import 'package:cat_app/configs/api_configs.dart';
import 'package:cat_app/models/Breed.dart';
import 'package:cat_app/models/Category.dart';
import 'package:cat_app/models/Favorite.dart';
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

  Future<List<ImageCat>> getRandomImages(int page, [Map<String, String> query]) async {

    String url = '$baseUrl/images/search?page=$page&limit=10';
    if (query != null) {
     if (query.containsKey('breed_id')) {
       url += '&breed_id=${query['breed_id']}';
     } else {
       if (query.containsKey('category_id')) {
         url += '&category_ids=${query['category_id']}';
       }
       print('url $url');
     }
    }
    final imagesCatsFromApi = await http.get(url, headers: {'x-api-key': apiKey});
    List<dynamic> decodedJson = jsonDecode(imagesCatsFromApi.body);
    var imagesCatsLists = decodedJson.map((e) => ImageCat.fromJson(e)).toList();
    return imagesCatsLists;
  }

  Future<List<ImageCat>>  getBreedImages(String breedId, int page) async {
    final breedImages = await this.getRandomImages(page, {'breed_id': breedId});
    return breedImages;
  }

  Future<List<ImageCat>> getCategoryImages(String categoryId, int page) async {
    final categoryImages = await this.getRandomImages(page, {'category_id': categoryId});
    return categoryImages;
  }

  Future<List<Favorite>> getFavorites() async {
    final favoritesFromApi = await http.get('$baseUrl/favourites', headers: {'x-api-key': apiKey});
    List<dynamic> decodedJson = jsonDecode(favoritesFromApi.body);
    var favoritesList = decodedJson.map((e) => Favorite.fromJson(e)).toList();
    return favoritesList;
  }
  
  Future<dynamic> saveFavoriteImage(String imageId) async {
    print('imageid $imageId');
    var body = jsonEncode({'image_id': imageId});
    final savedFavorite = await http.post('$baseUrl/favourites', headers: {'x-api-key': apiKey, "Content-Type": "application/json"}, body: body );
    return savedFavorite.body;
  }
}