import 'package:activities_repository/activities_repository.dart';
import 'package:bored_api/bored_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

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
      final activityMap = {
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
