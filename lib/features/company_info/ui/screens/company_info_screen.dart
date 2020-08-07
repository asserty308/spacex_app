import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_guide/core/ui/widgets/app_scaffold.dart';
import 'package:spacex_guide/features/company_info/bloc/about_screen/company_info_screen_cubit.dart';

// TODO: Fetch and display data

class CompanyInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => CompanyInfoScreenCubit(
      companyInfoRepository: RepositoryProvider.of(context),
    )..loadCompanyInfo(),
    child: _scaffold,
  );

  // Widgets

  Widget get _scaffold => AppScaffold(
    title: Text('About SpaceX'), 
    body: _body,
  );

  Widget get _body => BlocBuilder<CompanyInfoScreenCubit, CompanyInfoScreenState>(
    builder: (context, state) {
      if (state is CompanyInfoScreenLoaded) {
        return Center(
          child: Text(state.info.summary, style: TextStyle(color: Colors.white),),
        );
      }

      return Container();
    },
  );
}