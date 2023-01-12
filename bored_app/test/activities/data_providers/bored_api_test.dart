import 'package:bored_app/activities/data_providers/bored_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class _MockHttpClient extends Mock implements http.Client {}

void main() {
  group('boredApi', () {
    late http.Client httpClient;

    setUp(() {
      httpClient = _MockHttpClient();
    });

    group('constructor', () {
      test('can be instantiated without injected client', () {
        expect(BoredApi(), isNotNull);
      });
      test('can be instantiated with injected client', () {
        expect(BoredApi(httpClient: httpClient), isNotNull);
      });
    });
  });
}
