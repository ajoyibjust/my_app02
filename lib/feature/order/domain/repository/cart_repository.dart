import 'package:my_app2/feature/order/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<void> addCart(CartEntity product);
  Future<List<CartEntity>> getCart();
  Future<void> removeCart(String id);
  Future<bool> isCart(String id);

}
