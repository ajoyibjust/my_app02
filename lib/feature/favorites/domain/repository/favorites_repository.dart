import 'package:my_app2/feature/favorites/domain/entities/favorite_entity.dart';

abstract class FavoritesRepository {
  Future<void> addFavorite(FavoriteEntity product);
  Future<List<FavoriteEntity>> getFavorite();
  Future<void> removeFavorite(String id);
  Future<bool> isFavorite(String id);
}
