import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/features/company_info/data/models/company_info.dart';
import 'package:spacex_guide/features/company_info/data/repositories/company_info_repository.dart';

part 'company_info_screen_state.dart';

class CompanyInfoScreenCubit extends Cubit<CompanyInfoScreenState> {
  CompanyInfoScreenCubit() : super(CompanyInfoScreenInitial());

  final CompanyInfoRepository? companyInfoRepository = GetIt.I<CompanyInfoRepository>();

  Future<void> loadCompanyInfo() async {
    emit(CompanyInfoScreenLoading());

    try {
      final info = await companyInfoRepository!.getCompanyInfo();
      emit(CompanyInfoScreenLoaded(info));
    } catch (e) {
      print('CompanyInfoScreenCubit::loadCompanyInfo ERROR: $e');
      emit(CompanyInfoScreenError());
    }
  }
}
