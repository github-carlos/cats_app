import 'package:cat_app/models/Breed.dart';
import 'package:cat_app/models/Category.dart';
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

  @action
  loadBreeds() async {
    breeds = await catsApi.getBreeds();
  }

  @action
  loadCategories() async {
    categories = await catsApi.getCategories();
  }

  @action
  loadRandomImages(int page) async {
    if (page == null) {
      page = 1;
    }
    randomImages = await catsApi.getRandomImages(1);
  }
}