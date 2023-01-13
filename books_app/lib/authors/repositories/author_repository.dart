// ignore_for_file: lines_longer_than_80_chars

import 'package:books_app/authors/data_providers/open_library_api.dart';
import 'package:books_app/authors/models/models.dart';

/// Repository to call methods exposed by OpenLibraryApi
/// and transform data into Author List
class AuthorRepository {
  /// AuthorRepository constructor
  AuthorRepository({OpenLibraryApi? openLibraryApi})
      : _openLibraryApi = openLibraryApi ?? OpenLibraryApi();

  final OpenLibraryApi _openLibraryApi;

  /// maps the json decoded list returned from openLibraryApi.getAuthors to
  /// list of Authors
  Future<List<Author>> getAuthors(String query) async {
    final authorsJson = await _openLibraryApi.getAuthors(query);

    return authorsJson.map((author) => Author.fromMap(author as Map<String, dynamic>)).toList();
  }
}
