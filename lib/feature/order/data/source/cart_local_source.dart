import 'package:hive_flutter/adapters.dart';
import 'package:my_app2/feature/order/domain/entities/cart_entity.dart';

abstract class CartLocalSource {
  Future<void> addCart(CartEntity product);
  Future<List<CartEntity>> getCart();
  Future<void> removeCart(String id);
    Future<bool> isCart(String id);
}

class CartLocalSourceImpl implements CartLocalSource {
  final box = Hive.box("cart");
  @override
  Future<void> addCart(CartEntity favorite) async {
    final haveFavorite = box.values.any((e) => e['id'] == favorite.id);
    if (!haveFavorite) {
      await box.add(favorite.toJson());
    }
  }

  @override
  Future<void> removeCart(String id) async {
    final index = box.values.toList().indexWhere((e) => e['id'] == id);
    if (index != -1) {
      final key = box.keyAt(index);
      await box.delete(key);
    }
  }

  @override
  Future<List<CartEntity>> getCart() async {
    final favorite = box.values.map((e) => CartEntity.fromJson(e)).toList();
    return favorite;
  }

    @override
  Future<bool> isCart(String id) async {
    return box.values.any((e) => e['id'] == id);
  }

}
