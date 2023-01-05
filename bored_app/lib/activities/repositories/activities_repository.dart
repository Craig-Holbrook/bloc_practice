import 'package:bored_app/activities/data_providers/bored_api.dart';
import 'package:bored_app/activities/models/models.dart';

class ActivitiesRepository {
  final BoredApi _boredApi;

  ActivitiesRepository({BoredApi? boredApi}) : _boredApi = boredApi ?? BoredApi();

  Future<Activity> getActivity() async {
    final jsonAct = await _boredApi.getActivity();

    jsonAct['name'] = jsonAct['activity'];
    jsonAct['participants'] = jsonAct['participants'].toString();

    return Activity.fromMap(jsonAct);
  }
}
