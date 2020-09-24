// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_view_controller_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PageViewControllerStore on _PageViewControllerStoreBase, Store {
  final _$_pageControllerAtom =
      Atom(name: '_PageViewControllerStoreBase._pageController');

  @override
  PageController get _pageController {
    _$_pageControllerAtom.reportRead();
    return super._pageController;
  }

  @override
  set _pageController(PageController value) {
    _$_pageControllerAtom.reportWrite(value, super._pageController, () {
      super._pageController = value;
    });
  }

  final _$currentPageAtom =
      Atom(name: '_PageViewControllerStoreBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$_PageViewControllerStoreBaseActionController =
      ActionController(name: '_PageViewControllerStoreBase');

  @override
  void goTo(int page) {
    final _$actionInfo = _$_PageViewControllerStoreBaseActionController
        .startAction(name: '_PageViewControllerStoreBase.goTo');
    try {
      return super.goTo(page);
    } finally {
      _$_PageViewControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCurrentPage(int newPage) {
    final _$actionInfo = _$_PageViewControllerStoreBaseActionController
        .startAction(name: '_PageViewControllerStoreBase.changeCurrentPage');
    try {
      return super.changeCurrentPage(newPage);
    } finally {
      _$_PageViewControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
