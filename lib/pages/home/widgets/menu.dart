import 'package:cat_app/stores/page_view_controller_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import 'circle_button_with_icon.dart';

class Menu extends StatelessWidget {
  final PageViewControllerStore pageControllerStore = GetIt.instance.get<PageViewControllerStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleButtonWithIcon(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            circleColor:pageControllerStore.pageController.hasClients && pageControllerStore.currentPage == 0 ? Colors.blue : Colors.white,
            callback: () {
              pageControllerStore.goTo(0);
            },
          ),
          SizedBox(
            width: 20,
          ),
          CircleButtonWithIcon(
              icon: SvgPicture.asset('assets/icons/fav.svg'),
              circleColor: pageControllerStore.pageController.hasClients && pageControllerStore.currentPage == 1 ? Colors.blue : Colors.white,
              callback: () {
                pageControllerStore.goTo(1);
              })
        ],
      ),
    );
  }
}