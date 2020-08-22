import 'package:spacex_guide/features/company_info/data/datasources/company_info_api.dart';
import 'package:spacex_guide/features/company_info/data/models/company_info.dart';
import 'package:meta/meta.dart';

class CompanyInfoRepository {
  CompanyInfoRepository({
    @required this.companyInfoApi,
  });

  final CompanyInfoApi companyInfoApi;
  
  Future<CompanyInfoModel> getCompanyInfo() async {
    return await companyInfoApi.getCompanyInfo();
  }
}