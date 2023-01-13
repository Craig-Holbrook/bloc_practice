// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

import 'package:http/http.dart' as http;

///Exception for BoredApi request failure
class BoredRequestFailure implements Exception {}

///Api that makes http requests to BoredApi.com
class BoredApi {
  ///BoredApi constructor
  BoredApi({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  static const _baseUrl = 'boredapi.com';

  ///Make http get request to boredapi.com/api/activity and return json decoded body
  Future<Map<String, dynamic>> getActivity() async {
    final request = Uri.https(_baseUrl, 'api/activity');

    final response = await _httpClient.get(request);

    if (response.statusCode != 200) throw BoredRequestFailure();
    final jsonActivity = jsonDecode(response.body) as Map<String, dynamic>;

    return jsonActivity;
  }
}
