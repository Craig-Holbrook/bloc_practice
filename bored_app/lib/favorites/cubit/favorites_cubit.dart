import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:bored_app/activities/models/activity.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> with HydratedMixin {
  FavoritesCubit() : super(FavoritesState());

  void addFavorite(Activity activity) {
    emit(FavoritesState(favorites: [...state.favorites, activity]));
  }

  void removeFavorite(int index) {
    final favs = [...state.favorites];
    favs.removeAt(index);
    emit(FavoritesState(favorites: favs));
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) {
    var favoritesJson = json['favorites'] as List;
    var favsList = favoritesJson.map((e) => Activity.fromMap(e)).toList();
    return FavoritesState(favorites: favsList);
  }

  @override
  Map<String, dynamic>? toJson(FavoritesState state) {
    return {'favorites': state.favorites.map((e) => e.toMap()).toList()};
  }
}
