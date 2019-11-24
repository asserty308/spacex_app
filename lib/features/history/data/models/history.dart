import 'package:intl/intl.dart';

class History {
  History({
    this.id,
    this.title,
    this.eventDateUnix,
    this.flightNumber,
    this.details,
    this.articleUrl,
    this.wikiUrl,
  });

  int id, eventDateUnix, flightNumber;
  String title, details, articleUrl, wikiUrl;

  static History fromJSON(Map<String, dynamic> json) {
    return History(
      id: json['id'],
      title: json['title'],
      eventDateUnix: json['event_date_unix'],
      flightNumber: json['flight_number'],
      details: json['details'],
      articleUrl: json['links']['article'],
      wikiUrl: json['links']['wikipedia'],
    );
  }

  DateTime getDate() {
    return DateTime.fromMillisecondsSinceEpoch(eventDateUnix * 1000);
  }

  String formattedDate([String format = 'dd.MM.yyyy HH:mm:ss']) {
    final date = getDate();
    return DateFormat(format).format(date);
  }
}