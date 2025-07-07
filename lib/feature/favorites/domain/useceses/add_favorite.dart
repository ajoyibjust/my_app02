
import 'package:my_app2/feature/favorites/domain/entities/favorite_entity.dart';
import 'package:my_app2/feature/favorites/domain/repository/favorites_repository.dart';

class AddFavorite {
  final FavoritesRepository repository;

  AddFavorite(this.repository);

  Future<void> call(FavoriteEntity product) async {
    repository.addFavorite(product);
  }
}
