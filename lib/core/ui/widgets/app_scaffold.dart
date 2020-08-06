import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';

// TODO: Apply responsive layout 

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key key, 
    @required this.title, 
    @required this.body,
    this.actions,
    this.drawerEnabled = true, 
  }) : super(key: key);

  final Widget body;
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
    body: body,
  );
}