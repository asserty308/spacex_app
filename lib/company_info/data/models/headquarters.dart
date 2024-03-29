part of 'company_info.dart';

class CompanyHeadquarters {
  CompanyHeadquarters({
    this.address, 
    this.city, 
    this.state
  });

  CompanyHeadquarters.fromJSON(Map<String, dynamic> json) :
    address = json['address'],
    city = json['city'],
    state = json['state'];

  final String? address, city, state;
}