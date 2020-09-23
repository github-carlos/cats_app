import 'package:flutter/material.dart';
import 'package:cat_app/pages/home/widgets/header.dart';
import 'package:cat_app/pages/home/widgets/menu.dart';

class HomePage extends StatelessWidget {
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
          ],
        ),
      )),
    );
  }
}
