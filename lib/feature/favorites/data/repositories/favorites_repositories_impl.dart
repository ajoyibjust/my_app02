
import 'package:my_app2/feature/favorites/data/source/favorite_local_source.dart';
import 'package:my_app2/feature/favorites/domain/entities/favorite_entity.dart';
import 'package:my_app2/feature/favorites/domain/repository/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalSource local;

  FavoritesRepositoryImpl({required this.local});
  @override
  Future<void> addFavorite(FavoriteEntity favoride) async {
    return await local.addFavorite(favoride);
  }

  @override
  Future<List<FavoriteEntity>> getFavorite() async {
    return await local.getFavorite();
  }

  @override
  Future<void> removeFavorite(String id) {
    return local.removeFavorite(id);
  }

  @override
  Future<bool> isFavorite(String id) {
    return local.isFavorite(id);
  }
}
