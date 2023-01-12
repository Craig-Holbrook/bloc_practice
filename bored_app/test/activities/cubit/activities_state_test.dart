import 'package:bored_app/activities/cubit/activities_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('activity state', () {
    test('can be instantiated', () {
      expect(const ActivitiesState(status: ActivityRequestStatus.initial), isNotNull);
    });

    test('supports value equality', () {
      expect(const ActivitiesState(status: ActivityRequestStatus.initial),
          const ActivitiesState(status: ActivityRequestStatus.initial));
    });

    test('toString functionality', () {
      expect(const ActivitiesState(status: ActivityRequestStatus.initial).toString(),
          'ActivitiesState(status: ActivityRequestStatus.initial, activity: null)');
    });
  });
}
