import 'package:bloc_test/bloc_test.dart';
import 'package:bored_app/activities/cubit/activities_cubit.dart';
import 'package:bored_app/activities/models/activity.dart';
import 'package:bored_app/activities/repositories/activities_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockActivitiesRepository extends Mock implements ActivitiesRepository {}

void main() {
  late ActivitiesRepository activitiesRepository;
  late Activity activity;

  group('ActivitiesCubit', () {
    setUp(() {
      activitiesRepository = _MockActivitiesRepository();
      activity = activity = const Activity(
        name: 'test name',
        participants: 'test participants',
        type: 'test type',
      );
    });
    test('initial state is correct', () {
      final activitiesCubit = ActivitiesCubit(activitiesRepository: activitiesRepository);
      expect(activitiesCubit.state, const ActivitiesState(status: ActivityRequestStatus.initial));
    });

    blocTest<ActivitiesCubit, ActivitiesState>(
      'emits [loading, failed] when getActivity throws',
      setUp: () {
        when(() => activitiesRepository.getActivity()).thenThrow(Exception('oops'));
      },
      build: () => ActivitiesCubit(activitiesRepository: activitiesRepository),
      act: (cubit) => cubit.getActivity(),
      expect: () => <ActivitiesState>[
        const ActivitiesState(status: ActivityRequestStatus.loading),
        const ActivitiesState(status: ActivityRequestStatus.failed)
      ],
    );

    blocTest(
      'emits [loading, success with activity] when activitiesRepository.getActivity returns Activity ',
      setUp: () {
        when(() => activitiesRepository.getActivity()).thenAnswer((_) async => activity);
      },
      build: () => ActivitiesCubit(activitiesRepository: activitiesRepository),
      act: ((cubit) => cubit.getActivity()),
      expect: () => <ActivitiesState>[
        const ActivitiesState(status: ActivityRequestStatus.loading),
        ActivitiesState(status: ActivityRequestStatus.successful, activity: activity),
      ],
    );

    blocTest<ActivitiesCubit, ActivitiesState>(
      'reset emits initial state',
      build: () => ActivitiesCubit(activitiesRepository: activitiesRepository),
      seed: () => const ActivitiesState(status: ActivityRequestStatus.failed),
      act: (cubit) => cubit.reset(),
      expect: () => <ActivitiesState>[const ActivitiesState(status: ActivityRequestStatus.initial)],
    );
  });
}
