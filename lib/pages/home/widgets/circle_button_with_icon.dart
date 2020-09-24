import 'package:flutter/material.dart';
class CircleButtonWithIcon extends StatelessWidget {
  final Widget icon;
  final Color circleColor;
  final Function callback;

  CircleButtonWithIcon({@required this.icon, @required this.circleColor, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: circleColor,
      child: IconButton(icon: icon, onPressed: callback),
    );
  }
}