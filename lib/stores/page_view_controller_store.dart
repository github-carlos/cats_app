import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'page_view_controller_store.g.dart';

class PageViewControllerStore = _PageViewControllerStoreBase with _$PageViewControllerStore;

abstract class _PageViewControllerStoreBase with Store {

  @observable
  PageController _pageController = PageController();

  PageController get pageController {
    return _pageController;
  }

  @observable
  int currentPage =  0;

  @action
  void goTo(int page) {
    changeCurrentPage(page);
    _pageController.animateToPage(page, duration: Duration(milliseconds: 400), curve: Curves.linear);
  }

  @action
  changeCurrentPage(int newPage) {
    this.currentPage = newPage;
  }
}