import 'package:bloc_test/bloc_test.dart';
import 'package:bored_app/activities/cubit/activities_cubit.dart';
import 'package:bored_app/activities/models/activity.dart';
import 'package:bored_app/activities/repositories/activities_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockActivitiesRepository extends Mock implements ActivitiesRepository {}

void main() {
  group('ActivitiesCubit', () {
    late ActivitiesRepository activitiesRepository;

    setUp(() {
      activitiesRepository = _MockActivitiesRepository();
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(ActivitiesCubit(activitiesRepository: activitiesRepository), isNotNull);
      });
      test('initial state is correct', () {
        expect(ActivitiesCubit(activitiesRepository: activitiesRepository).state,
            const ActivitiesState(status: ActivityRequestStatus.initial));
      });
    });

    group('getActivity', () {
      late Activity activity;

      setUp(() {
        activity = activity = const Activity(
          name: 'test name',
          participants: 'test participants',
          type: 'test type',
        );
      });
      blocTest('activitiesRepository.getActivity is called once',
          setUp: () {
            when(() => activitiesRepository.getActivity()).thenAnswer((_) async => activity);
          },
          build: () => ActivitiesCubit(activitiesRepository: activitiesRepository),
          act: (cubit) => cubit.getActivity(),
          verify: (_) => verify(() => activitiesRepository.getActivity()).called(1));

      blocTest<ActivitiesCubit, ActivitiesState>(
        'emits [loading, failed] when activitiesRepository.getActivity throws',
        setUp: () {
          when(() => activitiesRepository.getActivity()).thenThrow(Exception('oops'));
        },
        build: () => ActivitiesCubit(activitiesRepository: activitiesRepository),
        act: (cubit) => cubit.getActivity(),
        expect: () => <ActivitiesState>[
          const ActivitiesState(status: ActivityRequestStatus.loading),
          const ActivitiesState(status: ActivityRequestStatus.failed),
        ],
      );

      blocTest<ActivitiesCubit, ActivitiesState>(
        'emits [loading, success with activity] when activitiesRepository.getActivity returns Activity',
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
    });

    group('reset', () {
      blocTest<ActivitiesCubit, ActivitiesState>(
        'emits initial state',
        build: () => ActivitiesCubit(activitiesRepository: activitiesRepository),
        seed: () => const ActivitiesState(status: ActivityRequestStatus.failed),
        act: (cubit) => cubit.reset(),
        expect: () => <ActivitiesState>[
          const ActivitiesState(status: ActivityRequestStatus.initial),
        ],
      );
    });
  });
}
