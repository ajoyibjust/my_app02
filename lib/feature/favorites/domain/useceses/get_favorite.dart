
import 'package:my_app2/feature/favorites/domain/entities/favorite_entity.dart';
import 'package:my_app2/feature/favorites/domain/repository/favorites_repository.dart';

class GetFavorite {
  final FavoritesRepository repository;

  GetFavorite(this.repository);

  Future<List<FavoriteEntity>> call() async {
    return await repository.getFavorite();
  }
}
