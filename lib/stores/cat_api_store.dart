import 'package:cat_app/models/Breed.dart';
import 'package:cat_app/models/Category.dart';
import 'package:cat_app/services/cats_api.dart';
import 'package:mobx/mobx.dart';
part 'cat_api_store.g.dart';

class CatApiStore = _CatApiStoreBase with _$CatApiStore;

abstract class _CatApiStoreBase with Store {

  CatsApi catsApi = CatsApi();
  _CatApiStoreBase() {
    loadBreeds();
    loadCategories();
  }
  @observable
  List<Breed> breeds;
  @observable
  List<Category> categories;


  @action
  loadBreeds() async {
    breeds = await catsApi.getBreeds();
  }

  loadCategories() async {
    categories = await catsApi.getCategories();
  }
}