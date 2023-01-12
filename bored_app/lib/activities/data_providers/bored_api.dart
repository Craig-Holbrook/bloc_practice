import 'dart:convert';

import 'package:http/http.dart' as http;

class BoredRequestFailure implements Exception {}

class BoredApi {
  final http.Client _httpClient;
  static const _baseUrl = 'boredapi.com';

  BoredApi({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<Map<String, dynamic>> getActivity() async {
    final request = Uri.https(_baseUrl, 'api/activity');

    final response = await _httpClient.get(request);

    if (response.statusCode != 200) throw BoredRequestFailure();
    final jsonActivity = jsonDecode(response.body) as Map<String, dynamic>;

    return jsonActivity;
  }
}
