// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Activity {
  final String name;
  final String participants;
  final String type;

  Activity({
    required this.name,
    required this.participants,
    required this.type,
  });

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      name: map['name'] as String,
      participants: map['participants'] as String,
      type: map['type'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'participants': participants,
      'type': type,
    };
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) =>
      Activity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Activity(name: $name, participants: $participants, type: $type)';
}
