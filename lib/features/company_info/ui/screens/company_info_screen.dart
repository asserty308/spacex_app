import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spacex_guide/core/ui/widgets/app_scaffold.dart';
import 'package:spacex_guide/features/company_info/bloc/about_screen/company_info_screen_cubit.dart';
import 'package:spacex_guide/features/company_info/ui/widgets/company_info.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppScaffold(
    title: const Text('About SpaceX'), 
    body: _body,
  );

  Widget get _body => BlocBuilder<CompanyInfoScreenCubit, CompanyInfoScreenState>(
    bloc: GetIt.I<CompanyInfoScreenCubit>()..loadCompanyInfo(),
    builder: (context, state) {
      if (state is CompanyInfoScreenLoaded) {
        return CompanyInfo(state: state);
      }

      return Container();
    },
  );
}