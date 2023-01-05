import 'package:books_app/authors/data_providers/open_library_api.dart';
import 'package:books_app/authors/models/models.dart';

class AuthorRepository {
  final OpenLibraryApi _openLibraryApi;

  AuthorRepository({OpenLibraryApi? openLibraryApi})
      : _openLibraryApi = openLibraryApi ?? OpenLibraryApi();

  Future<List<Author>> getAuthors(String query) async {
    final authorsJson = await _openLibraryApi.getAuthors(query);

    return authorsJson.map((e) => Author.fromMap(e)).toList();
  }
}
