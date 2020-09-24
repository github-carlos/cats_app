import 'package:cat_app/pages/home/widgets/home_body.dart';
import 'package:cat_app/stores/page_view_controller_store.dart';
import 'package:flutter/material.dart';
import 'package:cat_app/pages/home/widgets/header.dart';
import 'package:cat_app/pages/home/widgets/menu.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {

  PageViewControllerStore pageController;
  HomePage() {
    pageController = GetIt.instance.get<PageViewControllerStore>();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: 10,
            ),
            Menu(),
            SizedBox(height: 20,),
            HomeBody()
          ],
        ),
      )),
    );
  }
}



