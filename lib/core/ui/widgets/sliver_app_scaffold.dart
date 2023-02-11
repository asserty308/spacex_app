import 'package:flutter/material.dart';
import 'package:spacex_guide/core/ui/widgets/drawer.dart';

class SliverAppScaffold extends StatelessWidget {
  const SliverAppScaffold({
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
            drawer: drawerEnabled && isMobile ? AppDrawer() : null,
            body: CustomScrollView(
              slivers: [
                _appBar,
                body,
              ]
            ),
          ),
        ),
      ],
    );
  }

  Widget get _appBar => SliverAppBar(
    title: title,
    centerTitle: true,
    actions: actions,
    floating: true,
  );
}