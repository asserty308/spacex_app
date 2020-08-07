import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/core/ui/widgets/app_scaffold.dart';
import 'package:spacex_guide/features/about/bloc/about_screen/about_screen_cubit.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => AboutScreenCubit(),
    child: _scaffold,
  );

  // Widgets

  Widget get _scaffold => AppScaffold(
    title: Text('About SpaceX'), 
    body: Container(color: Colors.amber,),
  );
}