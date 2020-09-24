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

  final _$loadBreedsAsyncAction = AsyncAction('_CatApiStoreBase.loadBreeds');

  @override
  Future loadBreeds() {
    return _$loadBreedsAsyncAction.run(() => super.loadBreeds());
  }

  @override
  String toString() {
    return '''
breeds: ${breeds},
categories: ${categories}
    ''';
  }
}
