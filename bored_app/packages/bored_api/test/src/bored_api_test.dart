import 'package:bored_api/bored_api.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockHttpClient extends Mock implements http.Client {}

class _MockResponse extends Mock implements http.Response {}

class _FakeUri extends Fake implements Uri {}

void main() {
  group('BoredApi', () {
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

    group('getActivity', () {
      late http.Response response;
      late BoredApi boredApi;

      setUpAll(() {
        registerFallbackValue(_FakeUri());
      });

      setUp(() {
        response = _MockResponse();
        boredApi = BoredApi(httpClient: httpClient);
      });

      test('makes correct http request', () async {
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        await boredApi.getActivity();
        verify(
          () => httpClient.get(
            Uri.https(
              'boredapi.com',
              'api/activity',
            ),
          ),
        ).called(1);
      });
      test('throws BoredRequestFailure on non-200 http response', () {
        when(() => response.statusCode).thenReturn(400);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(boredApi.getActivity(), throwsA(isA<BoredRequestFailure>()));
      });
      test('returns correct data on valid response', () async {
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(
          '''
        {
	"activity": "Take a caffeine nap",
	"type": "relaxation",
	"participants": 1,
	"price": 0.1,
	"link": "",
	"key": "5092652",
	"accessibility": 0.08
}''',
        );
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        final actual = await boredApi.getActivity();
        expect(
          actual,
          isA<Map<String, dynamic>>()
              .having((a) => a['activity'], 'name', 'Take a caffeine nap')
              .having((a) => a['type'], 'type', 'relaxation')
              .having((a) => a['participants'], 'participants', 1),
        );
      });
    });
  });
}
