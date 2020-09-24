import 'package:cat_app/pages/home/home.dart';
import 'package:cat_app/services/cats_api.dart';
import 'package:cat_app/stores/cat_api_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:cat_app/stores/page_view_controller_store.dart';

import 'package:cat_app/services/cats_api.dart';

void main() {

  // testing

  var getIt = GetIt.instance;
  getIt.registerSingleton<PageViewControllerStore>(PageViewControllerStore());
  getIt.registerSingleton<CatApiStore>(CatApiStore());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cats App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}