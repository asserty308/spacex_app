part of 'company_info.dart';

class CompanyLinks {
  CompanyLinks({
    this.website, 
    this.flickr, 
    this.twitter, 
    this.elonTwitter
  });

  CompanyLinks.fromJSON(Map<String, dynamic> json) :
    website = json['website'],
    flickr = json['flickr'],
    twitter = json['twitter'],
    elonTwitter = json['elon_twitter'];

  final String? website, flickr, twitter, elonTwitter;
}