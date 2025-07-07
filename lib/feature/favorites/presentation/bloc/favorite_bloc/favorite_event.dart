
import 'package:my_app2/feature/favorites/domain/entities/favorite_entity.dart';

abstract class FavoriteEvent {}

class FavoriteAdd extends FavoriteEvent {
  final FavoriteEntity product;
  FavoriteAdd(this.product);
}

class FavoriteGet extends FavoriteEvent {}

class FavoriteRemove extends FavoriteEvent {
  final String id;

  FavoriteRemove(this.id);
}

class FavoriteCheck extends FavoriteEvent {
  final String id;

  FavoriteCheck(this.id);
}
