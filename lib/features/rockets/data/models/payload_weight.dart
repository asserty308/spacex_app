part of 'rocket.dart';

class RocketPayloadWeight {
  RocketPayloadWeight({
    this.id, 
    this.name, 
    this.kg, 
    this.lb,
  });

  final String id, name;
  final num kg, lb;

  RocketPayloadWeight.fromJSON(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    kg = json['kg'],
    lb = json['lb'];

  static List<RocketPayloadWeight> fromList(List<dynamic> json) {
    List<RocketPayloadWeight> payloads = [];

    for (final payload in json) {
      final p = RocketPayloadWeight.fromJSON(payload);
      payloads.add(p);
    }

    return payloads;
  }
}