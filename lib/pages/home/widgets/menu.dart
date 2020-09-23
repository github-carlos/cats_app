import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'circle_button_with_icon.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleButtonWithIcon(
          icon: SvgPicture.asset('assets/icons/home.svg'),
          callback: () {},
        ),
        SizedBox(
          width: 20,
        ),
        CircleButtonWithIcon(
            icon: SvgPicture.asset('assets/icons/fav.svg'),
            callback: () {})
      ],
    );
  }
}