import 'package:flutter/material.dart';

class LaunchDetailActionButton extends StatelessWidget {
  LaunchDetailActionButton({
    Key key,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final Icon icon;
  final Function onTap;

  final Color _foregroundColor = Colors.black87;
  final Color _backgroundColor = Colors.orange;
  final double _radius = 25;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: CircleAvatar(
        child: icon,
        backgroundColor: _backgroundColor,
        foregroundColor: _foregroundColor,
        radius: _radius,
      ),
      onTap: onTap,
    );
  }
}