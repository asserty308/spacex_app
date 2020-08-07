import 'package:spacex_guide/features/company_info/data/datasources/company_info_api.dart';
import 'package:spacex_guide/features/company_info/data/models/company_info.dart';

class CompanyInfoRepository {
  final _api = CompanyInfoApi();

  Future<CompanyInfoModel> getCompanyInfo() async {
    return await _api.getCompanyInfo();
  }
}