import 'package:hive_flutter/adapters.dart';
import 'package:my_app2/feature/favorites/domain/entities/favorite_entity.dart';

abstract class FavoritesLocalSource {
  Future<void> addFavorite(FavoriteEntity product);
  Future<List<FavoriteEntity>> getFavorite();
  Future<void> removeFavorite(String id);
  Future<bool> isFavorite(String id);
}

class FavoritesLocalSourceimpl implements FavoritesLocalSource {
  final box = Hive.box("favorite");
  @override
  Future<void> addFavorite(FavoriteEntity favorite) async {
    final haveFavorite = box.values.any((e) => e['id'] == favorite.id);
    if (!haveFavorite) {
      await box.add(favorite.toJson());
    }
  }

  @override
  Future<void> removeFavorite(String id) async {
    final index = box.values.toList().indexWhere((e) => e['id'] == id);
    if (index != -1) {
      final key = box.keyAt(index);
      await box.delete(key);
    }
  }

  @override
  Future<List<FavoriteEntity>> getFavorite() async {
    final favorite = box.values.map((e) => FavoriteEntity.fromJson(e)).toList();
    return favorite;
  }

  @override
  Future<bool> isFavorite(String id) async {
    return box.values.any((e) => e['id'] == id);
  }
}
