// ignore_for_file: lines_longer_than_80_chars

import 'package:activities_repository/activities_repository.dart';
import 'package:bored_api/bored_api.dart';

///repository that uses functions exposed by bored_api package
class ActivitiesRepository {
  ///ActivitiesRepository constructor
  ActivitiesRepository({BoredApi? boredApi}) : _boredApi = boredApi ?? BoredApi();

  final BoredApi _boredApi;

  ///calls boredApi.getActivity to get json data and returns Activity
  Future<Activity> getActivity() async {
    final jsonAct = await _boredApi.getActivity();
    jsonAct['name'] = jsonAct['activity'];
    jsonAct['participants'] = jsonAct['participants'].toString();

    return Activity.fromMap(jsonAct);
  }
}
