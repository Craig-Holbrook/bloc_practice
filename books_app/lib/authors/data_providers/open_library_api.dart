import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthorRequestFailure implements Exception {}

class AuthorNotFoundFailure implements Exception {}

class OpenLibraryApi {
  final http.Client _httpClient;

  static const _baseUrl = 'openlibrary.org';
  static const _limit = '5';

  OpenLibraryApi({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<List> getAuthors(String query) async {
    //build uri
    final request = Uri.https(
      _baseUrl,
      '/search/authors.json',
      {'q': query, 'limit': _limit},
    );
    //make the request

    final response = await _httpClient.get(request);

    if (response.statusCode != 200) throw AuthorRequestFailure();

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    if (!jsonBody.containsKey('docs')) throw AuthorNotFoundFailure();

    final list = jsonBody['docs'] as List;

    return list;
  }
}
