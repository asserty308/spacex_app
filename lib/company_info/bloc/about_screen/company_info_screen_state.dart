part of 'company_info_screen_cubit.dart';

@immutable
abstract class CompanyInfoScreenState {}

class CompanyInfoScreenInitial extends CompanyInfoScreenState {}
class CompanyInfoScreenLoading extends CompanyInfoScreenState {}

class CompanyInfoScreenLoaded extends CompanyInfoScreenState {
  CompanyInfoScreenLoaded(this.info);
  final CompanyInfoModel info;
}

class CompanyInfoScreenError extends CompanyInfoScreenState {}
