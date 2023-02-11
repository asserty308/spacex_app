import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key, 
    required this.title, 
    required this.body,
    this.actions,
    this.drawerEnabled = true, 
  });

  final Widget body;
  final bool drawerEnabled;
  final Widget title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) => _responsiveScaffold(context);

  Widget _responsiveScaffold(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Row(
      children: [
        if (!isMobile)
          AppDrawer(),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: title,
              centerTitle: true,
              actions: actions,
            ),
            drawer: drawerEnabled && isMobile ? AppDrawer() : null,
            body: body,
          ),
        ),
      ],
    );
  }
}