import 'package:activities_repository/activities_repository.dart';
import 'package:bored_app/activities/activities.dart';
import 'package:bored_app/app/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockActivitiesRespository extends Mock implements ActivitiesRepository {}

void main() {
  group('App', () {
    late ActivitiesRepository activitiesRepository;

    setUp(() {
      activitiesRepository = _MockActivitiesRespository();
    });
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        App(
          activitiesRepository: activitiesRepository,
        ),
      );
      expect(find.byType(ActivitiesPage), findsOneWidget);
    });
  });
}
