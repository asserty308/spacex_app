import 'package:spacex_guide/core/data/datasources/remote/spacex_api.dart';
import 'package:spacex_guide/features/company_info/data/models/company_info.dart';

class CompanyInfoApi extends SpaceXApi {
  Future<CompanyInfoModel> getCompanyInfo() async {
    final response = await fetchJSON('company/');
    return CompanyInfoModel.fromJSON(response);
  }
}