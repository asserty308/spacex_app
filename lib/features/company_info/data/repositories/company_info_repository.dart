import 'package:get_it/get_it.dart';
import 'package:spacex_guide/features/company_info/data/datasources/company_info_api.dart';
import 'package:spacex_guide/features/company_info/data/models/company_info.dart';

class CompanyInfoRepository {
  final CompanyInfoApi companyInfoApi = GetIt.I<CompanyInfoApi>();
  
  Future<CompanyInfoModel> getCompanyInfo() async {
    return await companyInfoApi.getCompanyInfo();
  }
}