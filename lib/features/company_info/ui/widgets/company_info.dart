import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/core/bloc/app_navigation/app_navigation_cubit.dart';
import 'package:spacex_guide/features/company_info/bloc/about_screen/company_info_screen_cubit.dart';
import 'package:spacex_guide/core/utility/int_extension.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({Key key, this.state}) : super(key: key);

  final CompanyInfoScreenLoaded state;

  @override
  Widget build(BuildContext context) => ListView(
    children: [
      _summary,
      _founderTile(context),
      _foundedTile,
      _valuationTile,
    ],
  );

  // Widgets

  Widget get _summary => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(state.info.summary, textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
  );

  Widget _founderTile(BuildContext context) => ListTile(
    title: Text('Founder', style: TextStyle(color: Colors.white),),
    subtitle: Text(state.info.founder, style: TextStyle(color: Colors.white),),
    onTap: () => BlocProvider.of<AppNavigationCubit>(context).launchUrl(state.info.links.elonTwitter, onError: () => null),
  );

  Widget get _foundedTile => ListTile(
    title: Text('Founded', style: TextStyle(color: Colors.white),),
    subtitle: Text(state.info.founded.toString(), style: TextStyle(color: Colors.white),),
  );

  Widget get _valuationTile => ListTile(
    title: Text('Valuation', style: TextStyle(color: Colors.white),),
    subtitle: Text('\$${state.info.valuation.toInt().toCommaSeparatedString()}', style: TextStyle(color: Colors.white),),
  );
}