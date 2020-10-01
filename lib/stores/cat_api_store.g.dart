// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CatApiStore on _CatApiStoreBase, Store {
  final _$breedsAtom = Atom(name: '_CatApiStoreBase.breeds');

  @override
  List<Breed> get breeds {
    _$breedsAtom.reportRead();
    return super.breeds;
  }

  @override
  set breeds(List<Breed> value) {
    _$breedsAtom.reportWrite(value, super.breeds, () {
      super.breeds = value;
    });
  }

  final _$categoriesAtom = Atom(name: '_CatApiStoreBase.categories');

  @override
  List<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$randomImagesAtom = Atom(name: '_CatApiStoreBase.randomImages');

  @override
  List<ImageCat> get randomImages {
    _$randomImagesAtom.reportRead();
    return super.randomImages;
  }

  @override
  set randomImages(List<ImageCat> value) {
    _$randomImagesAtom.reportWrite(value, super.randomImages, () {
      super.randomImages = value;
    });
  }

  final _$catImagesListAtom = Atom(name: '_CatApiStoreBase.catImagesList');

  @override
  List<ImageCat> get catImagesList {
    _$catImagesListAtom.reportRead();
    return super.catImagesList;
  }

  @override
  set catImagesList(List<ImageCat> value) {
    _$catImagesListAtom.reportWrite(value, super.catImagesList, () {
      super.catImagesList = value;
    });
  }

  final _$loadBreedsAsyncAction = AsyncAction('_CatApiStoreBase.loadBreeds');

  @override
  Future loadBreeds() {
    return _$loadBreedsAsyncAction.run(() => super.loadBreeds());
  }

  final _$loadCategoriesAsyncAction =
      AsyncAction('_CatApiStoreBase.loadCategories');

  @override
  Future loadCategories() {
    return _$loadCategoriesAsyncAction.run(() => super.loadCategories());
  }

  final _$loadBreedImagesAsyncAction =
      AsyncAction('_CatApiStoreBase.loadBreedImages');

  @override
  Future loadBreedImages(String breedId, int page, int size) {
    return _$loadBreedImagesAsyncAction
        .run(() => super.loadBreedImages(breedId, page, size));
  }

  final _$loadCategoryImagesAsyncAction =
      AsyncAction('_CatApiStoreBase.loadCategoryImages');

  @override
  Future loadCategoryImages(String categoryId, int page, int size) {
    return _$loadCategoryImagesAsyncAction
        .run(() => super.loadCategoryImages(categoryId, page, size));
  }

  final _$loadRandomImagesAsyncAction =
      AsyncAction('_CatApiStoreBase.loadRandomImages');

  @override
  Future loadRandomImages(int page) {
    return _$loadRandomImagesAsyncAction
        .run(() => super.loadRandomImages(page));
  }

  final _$_CatApiStoreBaseActionController =
      ActionController(name: '_CatApiStoreBase');

  @override
  dynamic clearCatsListImages() {
    final _$actionInfo = _$_CatApiStoreBaseActionController.startAction(
        name: '_CatApiStoreBase.clearCatsListImages');
    try {
      return super.clearCatsListImages();
    } finally {
      _$_CatApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
breeds: ${breeds},
categories: ${categories},
randomImages: ${randomImages},
catImagesList: ${catImagesList}
    ''';
  }
}
