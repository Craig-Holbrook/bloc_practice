import 'dart:developer';

import 'package:activities_repository/activities_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesCubit(this._activitiesRepository)
      : super(const ActivitiesState(status: ActivityRequestStatus.initial));

  final ActivitiesRepository _activitiesRepository;

  Future<void> getActivity() async {
    emit(const ActivitiesState(status: ActivityRequestStatus.loading));

    try {
      final activity = await _activitiesRepository.getActivity();
      emit(
        ActivitiesState(
          status: ActivityRequestStatus.successful,
          activity: activity,
        ),
      );
    } catch (e) {
      log('error : $e');
      emit(const ActivitiesState(status: ActivityRequestStatus.failed));
    }
  }

  void reset() {
    emit(const ActivitiesState(status: ActivityRequestStatus.initial));
  }
}
