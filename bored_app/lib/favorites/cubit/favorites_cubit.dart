import 'package:activities_repository/activities_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> with HydratedMixin {
  FavoritesCubit() : super(FavoritesState());

  void addFavorite(Activity activity) {
    emit(FavoritesState(favorites: [...state.favorites, activity]));
  }

  void removeFavorite(int index) {
    final favs = [...state.favorites]..removeAt(index);
    emit(FavoritesState(favorites: favs));
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) {
    final favoritesJson = json['favorites'] as List;
    final favsList = favoritesJson
        .map((activity) => Activity.fromMap(activity as Map<String, dynamic>))
        .toList();
    return FavoritesState(favorites: favsList);
  }

  @override
  Map<String, dynamic>? toJson(FavoritesState state) {
    return {'favorites': state.favorites.map((e) => e.toMap()).toList()};
  }
}
