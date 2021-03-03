part of 'launch.dart';

class LaunchLinksModel {
  LaunchLinksModel({
    this.patchSmall,
    this.patchLarge,
    this.redditCampaign,
    this.redditLaunch,
    this.redditMedia,
    this.redditRecovery,
    this.flickrSmall,
    this.flickrOriginal,
    this.presskit,
    this.webcast,
    this.article,
    this.wikipedia,
  });

  final String? patchSmall, patchLarge;
  final String? redditCampaign, redditLaunch, redditMedia, redditRecovery;
  final List<String>? flickrSmall, flickrOriginal;
  final String? presskit;
  final String? webcast;
  final String? article;
  final String? wikipedia;

  LaunchLinksModel.fromJSON(Map<String, dynamic> json) :
    patchSmall = json['patch']['small'],
    patchLarge = json['patch']['large'],
    redditCampaign = json['reddit']['campaign'],
    redditLaunch = json['reddit']['launch'],
    redditMedia = json['reddit']['media'],
    redditRecovery = json['reddit']['recovery'],
    flickrSmall = List<String>.from(json['flickr']['small']),
    flickrOriginal = List<String>.from(json['flickr']['original']),
    presskit = json['presskit'],
    webcast = json['webcast'],
    article = json['article'],
    wikipedia = json['wikipedia'];
}
