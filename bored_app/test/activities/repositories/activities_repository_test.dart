import 'package:bored_app/activities/data_providers/bored_api.dart';
import 'package:bored_app/activities/models/activity.dart';
import 'package:bored_app/activities/repositories/activities_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockBoredApi extends Mock implements BoredApi {}

void main() {
  group('activity repository', () {
    late BoredApi boredApi;
    late ActivitiesRepository activitiesRepository;

    setUp(() {
      boredApi = _MockBoredApi();
      activitiesRepository = ActivitiesRepository(boredApi: boredApi);
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(activitiesRepository, isNotNull);
      });
    });

    group('getActivity', () {
      final Map<String, dynamic> activityMap = {
        'activity': 'test name',
        'participants': 'test participants',
        'type': 'test type',
      };
      const activity = Activity(
        name: 'test name',
        participants: 'test participants',
        type: 'test type',
      );
      test('boredApi.getActivity is called once', () async {
        when(() => boredApi.getActivity()).thenAnswer((_) async => activityMap);
        await activitiesRepository.getActivity();
        verify(() => boredApi.getActivity()).called(1);
      });

      test('returns Activity', () async {
        when(() => boredApi.getActivity()).thenAnswer((_) async => activityMap);
        final result = await activitiesRepository.getActivity();
        expect(result, activity);
      });
    });
  });
}
