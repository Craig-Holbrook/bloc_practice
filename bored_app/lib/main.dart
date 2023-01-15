import 'package:activities_repository/activities_repository.dart';
import 'package:bored_app/app/app.dart';
import 'package:bored_app/bootstrap.dart';

void main() {
  bootstrap(() {
    final activitiesRepository = ActivitiesRepository();
    return App(
      activitiesRepository: activitiesRepository,
    );
  });
}
