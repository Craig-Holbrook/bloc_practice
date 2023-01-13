// ignore_for_file: lines_longer_than_80_chars

import 'package:activities_repository/activities_repository.dart';
import 'package:test/test.dart';

void main() {
  late Activity activity;

  final activityMap = {
    'name': 'test name',
    'participants': 'test participants',
    'type': 'test type'
  };

  group('activity model tests', () {
    setUp(() {
      activity = const Activity(
        name: 'test name',
        participants: 'test participants',
        type: 'test type',
      );
    });
    test('can be instantiated', () {
      expect(activity, isNotNull);
    });

    test('toMap and fromMap convert correctly', () {
      expect(activity.toMap(), activityMap);
      expect(Activity.fromMap(activityMap), activity);
    });

    test('toString functionality', () {
      expect(
        activity.toString(),
        'Activity(name: test name, participants: test participants, type: test type)',
      );
    });

    test('supports value equality', () {
      expect(
        activity,
        const Activity(
          name: 'test name',
          participants: 'test participants',
          type: 'test type',
        ),
      );
    });
  });
}
