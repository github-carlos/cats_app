import 'package:flutter/material.dart';
class CircleButtonWithIcon extends StatelessWidget {
  final Widget icon;
  final Function callback;

  CircleButtonWithIcon({@required this.icon, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: IconButton(icon: icon, onPressed: callback),
    );
  }
}