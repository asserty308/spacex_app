import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/features/history/data/repositories/history_repository.dart';
import 'package:spacex_guide/features/launches/data/repositories/launch_repository.dart';

class AppRepositoryProvider extends StatelessWidget {
  final Widget child;

  const AppRepositoryProvider({
    Key key, 
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
    providers: [
      RepositoryProvider(create: (context) => LaunchRepository()),
      RepositoryProvider(create: (context) => HistoryRepository()),
    ],
    child: child,
  );
}