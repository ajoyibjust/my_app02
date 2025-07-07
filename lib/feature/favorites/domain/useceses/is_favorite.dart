
import 'package:my_app2/feature/favorites/domain/repository/favorites_repository.dart';

class IsFavorite {
  final FavoritesRepository repository;

  IsFavorite(this.repository);

  Future<bool> call(String id) async {
    return await repository.isFavorite(id);
  }
}
