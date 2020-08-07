part 'headquarters.dart';
part 'links.dart';

class CompanyInfoModel {
  CompanyInfoModel({
    this.name, 
    this.founder, 
    this.founded, 
    this.employees, 
    this.vehicles, 
    this.launchSites, 
    this.testSites, 
    this.ceo, 
    this.cto, 
    this.coo, 
    this.ctoPropulsion, 
    this.valuation, 
    this.headquarters, 
    this.links, 
    this.summary
  });

  final String name;
  final String founder;
  final int founded, employees, vehicles, launchSites, testSites;
  final String ceo, cto, coo, ctoPropulsion;
  final num valuation;
  final CompanyHeadquarters headquarters;
  final CompanyLinks links;
  final String summary;


  CompanyInfoModel.fromJSON(Map<String, dynamic> json) :
    name = json['name'],
    founder = json['founder'],
    founded = json['founded'],
    employees = json['employees'],
    vehicles = json['vehicles'],
    launchSites = json['launch_sites'],
    testSites = json['test_sites'],
    ceo = json['ceo'],
    cto = json['cto'],
    coo = json['coo'],
    ctoPropulsion = json['cto_propulsion'],
    valuation = json['valuation'],
    headquarters = CompanyHeadquarters.fromJSON(json['headquarters']),
    links = CompanyLinks.fromJSON(json['links']),
    summary = json['summary'];
}