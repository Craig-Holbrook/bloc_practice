import 'package:books_app/authors/bloc/authors_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorsListScreen extends StatelessWidget {
  const AuthorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for authors'),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              showSearch(
                context: context,
                delegate: AuthorsSearchDelegate(),
              ).then((value) => context.read<AuthorsBloc>().add(AuthorQueryTextChanged(query: '')));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class AuthorsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  TextInputAction get textInputAction => TextInputAction.none;

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<AuthorsBloc>().add(AuthorQueryTextChanged(query: query));
    return BlocBuilder<AuthorsBloc, AuthorsState>(
      builder: (_, state) {
        if (state.status != AuthorRequestStatus.success) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: state.status == AuthorRequestStatus.loading
                      ? const CircularProgressIndicator()
                      : Text(state.status == AuthorRequestStatus.initial
                          ? 'Search for an author'
                          : 'Search failed'))
            ],
          );
        }
        if (state.authors.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Center(child: Text('No authors found.')),
            ],
          );
        }
        return ListView.builder(
            itemCount: state.authors.length,
            itemBuilder: (ctx, i) {
              return ListTile(
                title: Text(state.authors[i].name),
                subtitle: Text(
                  'Work count: ${state.authors[i].workCount}',
                ),
              );
            });
      },
    );
  }

  @override
  void close(BuildContext context, result) {
    //result not needed for sample app
    super.close(context, result);
  }

  @override
  Widget buildResults(BuildContext context) {
    //not needed for sample app. using buildSuggestions.
    return Container();
  }
}
