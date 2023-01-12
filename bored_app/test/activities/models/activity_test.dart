import 'package:bored_app/activities/models/activity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Activity activity;

  Map<String, dynamic> activityMap = {
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
