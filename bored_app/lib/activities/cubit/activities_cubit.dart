import 'package:activities_repository/activities_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  final ActivitiesRepository _activitiesRepository;
  ActivitiesCubit({required activitiesRepository})
      : _activitiesRepository = activitiesRepository,
        super(const ActivitiesState(status: ActivityRequestStatus.initial));

  void getActivity() async {
    emit(const ActivitiesState(status: ActivityRequestStatus.loading));

    try {
      final activity = await _activitiesRepository.getActivity();
      emit(ActivitiesState(status: ActivityRequestStatus.successful, activity: activity));
    } catch (e) {
      // ignore: avoid_print
      print('error : $e');
      emit(const ActivitiesState(status: ActivityRequestStatus.failed));
    }
  }

  void reset() {
    emit(const ActivitiesState(status: ActivityRequestStatus.initial));
  }
}
