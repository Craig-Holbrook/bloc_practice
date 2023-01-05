import 'package:bloc/bloc.dart';
import 'package:bored_app/activities/models/models.dart';
import 'package:bored_app/activities/repositories/activities_repository.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  final ActivitiesRepository _activitiesRepository;
  ActivitiesCubit({required activitiesRepository})
      : _activitiesRepository = activitiesRepository,
        super(ActivitiesState(status: ActivityRequestStatus.initial));

  void getActivity() async {
    emit(ActivitiesState(status: ActivityRequestStatus.loading));

    try {
      final activity = await _activitiesRepository.getActivity();
      emit(ActivitiesState(status: ActivityRequestStatus.successful, activity: activity));
    } catch (e) {
      // ignore: avoid_print
      print('error : $e');
      emit(ActivitiesState(status: ActivityRequestStatus.failed));
    }
  }

  void reset() {
    emit(ActivitiesState(status: ActivityRequestStatus.initial));
  }
}
