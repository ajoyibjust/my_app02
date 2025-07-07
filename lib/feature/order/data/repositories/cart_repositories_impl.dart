import 'package:my_app2/feature/order/data/source/cart_local_source.dart';
import 'package:my_app2/feature/order/domain/entities/cart_entity.dart';
import 'package:my_app2/feature/order/domain/repository/cart_repository.dart';

class CartRepositoriesImpl implements CartRepository {
  final CartLocalSource local;

  CartRepositoriesImpl({required this.local});

  @override
  Future<void> addCart(CartEntity product) async {
  await local.addCart(product);
  }

  @override
  Future<List<CartEntity>> getCart() async {
    return await local.getCart();
  }

  @override
  Future<void> removeCart(String id) async {
    local.removeCart(id);
  }

    @override
  Future<bool> isCart(String id) {
    return local.isCart(id);
  }

}
