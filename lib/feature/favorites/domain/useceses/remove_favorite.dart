
import 'package:my_app2/feature/favorites/domain/repository/favorites_repository.dart';

class RemoveFavorite {
  final FavoritesRepository repository;

  RemoveFavorite(this.repository);

  Future<void> call(String id) async {
    return await repository.removeFavorite(id);
  }
}
