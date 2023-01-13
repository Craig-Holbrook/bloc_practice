import 'package:equatable/equatable.dart';

/// A model representing an activity containing
/// activiate name, number of participants, and the type
class Activity extends Equatable {
  /// Activity constructor
  const Activity({
    required this.name,
    required this.participants,
    required this.type,
  });

  /// Converts [Map] to [Activity]
  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      name: map['name'] as String,
      participants: map['participants'] as String,
      type: map['type'] as String,
    );
  }

  /// name for [Activity]
  final String name;

  /// Number of people that can participate for [Activity]
  final String participants;

  /// Type for [Activity]
  final String type;

  /// Converts [Activity] to [Map]
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
