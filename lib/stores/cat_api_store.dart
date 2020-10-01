import 'package:cat_app/models/Breed.dart';
import 'package:cat_app/models/Category.dart';
import 'package:cat_app/models/Favorite.dart';
import 'package:cat_app/models/ImageCat.dart';
import 'package:cat_app/services/cats_api.dart';
import 'package:mobx/mobx.dart';
part 'cat_api_store.g.dart';

class CatApiStore = _CatApiStoreBase with _$CatApiStore;

abstract class _CatApiStoreBase with Store {

  CatsApi catsApi = CatsApi();
  _CatApiStoreBase() {
    loadBreeds();
    loadCategories();
    loadRandomImages(1);
  }
  @observable
  List<Breed> breeds;
  @observable
  List<Category> categories;
  @observable
  List<ImageCat> randomImages;

  @observable
  List<ImageCat> catImagesList;
  @observable
  List<Favorite> favoriteImages;

  @action
  loadBreeds() async {
    breeds = await catsApi.getBreeds();
  }

  @action
  loadCategories() async {
    categories = await catsApi.getCategories();
  }

  @action
  loadBreedImages(String breedId, int page, int size) async {
    if (page == null) {
      page = 1;
    }
    if (size == null) {
      size = 10;
    }
    catImagesList = await catsApi.getBreedImages(breedId, page);
  }

  @action
  loadCategoryImages(String categoryId, int page, int size) async {
    if (page == null) {
      page = 1;
    }
    if (size == null) {
      size = 10;
    }
    catImagesList = await catsApi.getCategoryImages(categoryId, page);
  }

  @action
  loadFavoriteImages() async {
    favoriteImages = await catsApi.getFavorites();
    print('loading favorites $favoriteImages');
  }

  saveFavorite(String imageId) async {
    final savedFavorite = await catsApi.saveFavoriteImage(imageId);
    loadFavoriteImages();
    print('saved favorite $savedFavorite');
    return;
  }


  getCatListImages(String resourceName, String resourceId, int page, int size) {
    switch(resourceName) {
      case 'breed':
        loadBreedImages(resourceId, page, size);
        break;
      case 'category':
        loadCategoryImages(resourceId, page, size);
        break;
      default:
        break;
    }
  }

  @action clearCatsListImages() {
    catImagesList = null;
  }

  @action
  loadRandomImages(int page) async {
    randomImages = null;
    if (page == null) {
      page = 1;
    }
    randomImages = await catsApi.getRandomImages(1);
  }
}