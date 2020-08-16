import 'package:flutter/material.dart';

class SliverScrollView extends StatelessWidget {
  const SliverScrollView({
    Key key, 
    @required this.header, 
    @required this.body, 
    this.onBackPressed
  }) : super(key: key);

  final Widget header;
  final Widget body;

  /// When set, the back button is shown.
  final Function(BuildContext context) onBackPressed;

  @override
  Widget build(BuildContext context) => NestedScrollView(
    headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
      SliverAppBar(
        expandedHeight: 200.0,
        floating: false,
        pinned: true,
        elevation: 0,
        leading: onBackPressed == null ? null : IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => onBackPressed(context),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: header,
        ),
      )
    ],
    body: body,
  );
}