
import 'package:my_app2/feature/order/domain/entities/cart_entity.dart';
import 'package:my_app2/feature/order/domain/repository/cart_repository.dart';

class GetCart {
  final CartRepository repository;

  GetCart(this.repository);

  Future<List<CartEntity>> call() async {
    return await repository.getCart();
  }
}
