import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key key, 
    this.drawerEnabled = true, 
    this.child,
    this.title,
    this.actions,
  }) : super(key: key);

  final Widget child;
  final bool drawerEnabled;
  final Widget title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: title,
      centerTitle: true,
      actions: actions,
    ),
    drawer: drawerEnabled ? AppDrawer() : null,
    body: child,
  );
}