part of 'activities_cubit.dart';

enum ActivityRequestStatus { initial, loading, successful, failed }

class ActivitiesState extends Equatable {
  final ActivityRequestStatus status;
  final Activity? activity;

  const ActivitiesState({
    required this.status,
    this.activity,
  });

  @override
  String toString() => 'ActivitiesState(status: $status, activity: $activity)';

  @override
  List<Object?> get props => [status, activity];
}
