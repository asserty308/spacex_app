import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/services/alerts.dart';

class AppServiceProvider extends StatelessWidget {
  const AppServiceProvider({
    Key key, 
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
    providers: [
      RepositoryProvider(create: (context) => AlertService())
    ], 
    child: child
  );
}