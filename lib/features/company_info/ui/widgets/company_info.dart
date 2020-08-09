import 'package:flutter/material.dart';
import 'package:spacex_guide/features/company_info/bloc/about_screen/company_info_screen_cubit.dart';
import 'package:spacex_guide/core/utility/int_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({Key key, this.state}) : super(key: key);

  final CompanyInfoScreenLoaded state;

  @override
  Widget build(BuildContext context) => ListView(
    children: [
      _summary,
      _founderTile,
      _foundedTile,
      _valuationTile,
    ],
  );

  // Widgets

  Widget get _summary => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(state.info.summary, textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
  );

  Widget get _founderTile => ListTile(
    title: Text('Founder', style: TextStyle(color: Colors.white),),
    subtitle: Text(state.info.founder, style: TextStyle(color: Colors.white),),
    onTap: () async {
      if (await canLaunch(state.info.links.elonTwitter)) {
        launch(state.info.links.elonTwitter);
      }
    },
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