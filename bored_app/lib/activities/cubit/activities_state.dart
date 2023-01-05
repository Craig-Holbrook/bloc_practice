part of 'activities_cubit.dart';

enum ActivityRequestStatus { initial, loading, successful, failed }

class ActivitiesState {
  final ActivityRequestStatus status;
  final Activity? activity;

  ActivitiesState({
    required this.status,
    this.activity,
  });

  @override
  String toString() => 'ActivitiesState(status: $status, activity: $activity)';
}
