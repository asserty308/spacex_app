import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/app/bloc/app_navigation/app_navigation_cubit.dart';
import 'package:spacex_guide/company_info/bloc/about_screen/company_info_screen_cubit.dart';
import 'package:spacex_guide/app/utility/int_extension.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({super.key, this.state});

  final CompanyInfoScreenLoaded? state;

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
    child: Text(state!.info.summary!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white),),
  );

  Widget _founderTile(BuildContext context) => ListTile(
    title: const Text('Founder', style: TextStyle(color: Colors.white),),
    subtitle: Text(state!.info.founder!, style: const TextStyle(color: Colors.white),),
    onTap: () => GetIt.I<AppNavigationCubit>().launchUrl(state!.info.links!.elonTwitter, onError: () => null),
  );

  Widget get _foundedTile => ListTile(
    title: const Text('Founded', style: TextStyle(color: Colors.white),),
    subtitle: Text(state!.info.founded.toString(), style: const TextStyle(color: Colors.white),),
  );

  Widget get _valuationTile => ListTile(
    title: const Text('Valuation', style: TextStyle(color: Colors.white),),
    subtitle: Text('\$${state!.info.valuation!.toInt().toCommaSeparatedString()}', style: const TextStyle(color: Colors.white),),
  );
}