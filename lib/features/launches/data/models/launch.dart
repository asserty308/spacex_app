import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'launch_fairings.dart';
part 'launch_cores.dart';
part 'launch_links.dart';
part 'date_precision.dart';

class LaunchModel {
  LaunchModel({
    @required this.id,
    @required this.flightNumber,
    @required this.name,
    @required this.date,
    @required this.datePrecision,
    this.staticFireDate,
    this.tbd = false,
    this.net = false,
    this.window,
    this.rocket,
    this.success,
    @required this.upcoming,
    this.details,
    this.crew,
    this.ships,
    this.capsules,
    this.payloads,
    this.launchpad,
    this.failures,
    this.fairings,
    this.cores,
    this.links,
    this.autoUpdate,
  });

  final int flightNumber, window;
  final String id, name, rocket, details, launchpad;
  final DateTime date, staticFireDate;
  final DatePrecision datePrecision;
  final bool tbd, net, success, upcoming, autoUpdate;
  final List<String> failures, crew, ships, capsules;
  final List<dynamic> payloads;
  final LaunchFairingsModel fairings;
  final List<LaunchCoreModel> cores;
  final LaunchLinksModel links;

  LaunchModel.fromJSON(Map<String, dynamic> json) :
    flightNumber = json['flight_number'],
    name = json['name'],
    date = DateTime.fromMillisecondsSinceEpoch(json['date_unix'] * 1000),
    datePrecision = DatePrecisionUtil.fromString(json['date_precision']),
    staticFireDate = _staticFireDateUnix(json['static_fire_date_unix']),
    tbd = json['tbd'],
    net = json['net'],
    window = json['window'],
    rocket = json['rocket'],
    success = json['success'],
    failures = List<String>.from(json['failures']),
    upcoming = json['upcoming'],
    details = json['details'],
    fairings = json['fairings'] == null ? null : LaunchFairingsModel.fromJSON(json['fairings']),
    crew = List<String>.from(json['crew']),
    ships = List<String>.from(json['ships']),
    capsules = List<String>.from(json['capsules']),
    payloads = json['payloads'],
    launchpad = json['launchpad'],
    cores = LaunchCoreModel.fromList(json['cores']),
    links = LaunchLinksModel.fromJSON(json['links']),
    autoUpdate = json['auto_update'],
    id = json['id'];

  /// Converts the unix timestamp of the launch to a human readable string.
  /// The time will always be set to the devices locale.
  String formattedLaunchDate() {
    switch (datePrecision) {
      case DatePrecision.quarter:
      case DatePrecision.half:
      case DatePrecision.year:
        // Runs for quarter, half and year
        return DateFormat('yyyy').format(date);
      case DatePrecision.month:
        return DateFormat('MMMM yyyy').format(date);
      case DatePrecision.day:
        return DateFormat('dd.MM.yyyy').format(date);
      case DatePrecision.hour:
        return DateFormat('dd.MM.yyyy HH:mm:ss').format(date);
    }

    return '';
  }

  static DateTime _staticFireDateUnix(dynamic unix) {
    if (unix == null) {
      return null;
    }

    return DateTime.fromMillisecondsSinceEpoch(unix * 1000);
  }
}