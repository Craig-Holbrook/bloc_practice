// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

import 'package:http/http.dart' as http;

/// Exception for non-200 request response
class AuthorRequestFailure implements Exception {}

/// Exception for when json is returned with unexpected format
class AuthorNotFoundFailure implements Exception {}

/// Class that handles making http requests to openlibrary.org
class OpenLibraryApi {
  ///constructor
  OpenLibraryApi({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  static const _baseUrl = 'openlibrary.org';
  static const _limit = '5';

  /// Makes http request using query parameter and returns json decoded data
  Future<List<dynamic>> getAuthors(String query) async {
    final request = Uri.https(
      _baseUrl,
      '/search/authors.json',
      {'q': query, 'limit': _limit},
    );

    final response = await _httpClient.get(request);

    if (response.statusCode != 200) throw AuthorRequestFailure();

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    if (!jsonBody.containsKey('docs')) throw AuthorNotFoundFailure();

    final list = jsonBody['docs'] as List<dynamic>;

    return list;
  }
}
