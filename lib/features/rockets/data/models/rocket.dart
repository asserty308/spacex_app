import 'package:intl/intl.dart';

part 'first_stage.dart';
part 'second_stage.dart';
part 'engines.dart';
part 'landing_legs.dart';
part 'payload_weight.dart';

class RocketModel {
  RocketModel({
    this.id, 
    this.name, 
    this.type, 
    this.active, 
    this.stages, 
    this.boosters, 
    this.costPerLaunch, 
    this.successRate, 
    this.firstFlight, 
    this.country, 
    this.company, 
    this.heightMeters, 
    this.diameterMeters, 
    this.massKg, 
    this.payloadWeights, 
    this.firstStage, 
    this.secondStage, 
    this.engines, 
    this.landingLegs, 
    this.flickrImages, 
    this.wikipedia, 
    this.description
  });

  final String id, name, type;
  final bool active;
  final num stages, boosters, costPerLaunch, successRate;
  final DateTime firstFlight;
  final String country, company;
  final num heightMeters, diameterMeters, massKg;
  final List<RocketPayloadWeight> payloadWeights; 
  final RocketFirstStage firstStage;
  final RocketSecondStage secondStage;
  final RocketEngines engines;
  final RocketLandingLegs landingLegs;
  final List<String> flickrImages;
  final String wikipedia;
  final String description;

  RocketModel.fromJSON(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    type = json['type'],
    active = json['active'],
    stages = json['stages'],
    boosters = json['boosters'],
    costPerLaunch = json['cost_per_launch'],
    successRate = json['success_rate_pct'],
    firstFlight = DateFormat('yyyy-MM-dd').parse(json['first_flight']),
    country = json['country'],
    company = json['company'],
    heightMeters = json['height']['meters'],
    diameterMeters = json['diameter']['meters'],
    massKg = json['mass']['kg'],
    payloadWeights = RocketPayloadWeight.fromList(json['payload_weights']),
    firstStage = RocketFirstStage.fromJSON(json['first_stage']),
    secondStage = RocketSecondStage.fromJSON(json['second_stage']),
    engines = RocketEngines.fromJSON(json['engines']),
    landingLegs = RocketLandingLegs.fromJSON(json['landing_legs']),
    flickrImages = json['flickr_images'],
    wikipedia = json['wikipedia'],
    description = json['description'];
}