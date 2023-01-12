import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  const Activity({
    required this.name,
    required this.participants,
    required this.type,
  });

  final String name;
  final String participants;
  final String type;

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

  @override
  String toString() => 'Activity(name: $name, participants: $participants, type: $type)';

  @override
  List<Object?> get props => [name, participants, type];
}
