import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spacex_guide/features/company_info/data/models/company_info.dart';
import 'package:spacex_guide/features/company_info/data/repositories/company_info_repository.dart';

part 'company_info_screen_state.dart';

class CompanyInfoScreenCubit extends Cubit<CompanyInfoScreenState> {
  CompanyInfoScreenCubit({
    @required this.companyInfoRepository,
  }) : super(CompanyInfoScreenInitial());

  final CompanyInfoRepository companyInfoRepository;

  Future<void> loadCompanyInfo() async {
    emit(CompanyInfoScreenLoading());

    try {
      final info = await companyInfoRepository.getCompanyInfo();
      emit(CompanyInfoScreenLoaded(info));
    } catch (e) {
      print('CompanyInfoScreenCubit::loadCompanyInfo ERROR: $e');
      emit(CompanyInfoScreenError());
    }
  }
}
