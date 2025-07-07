import 'package:my_app2/feature/order/domain/entities/cart_entity.dart';
import 'package:my_app2/feature/order/domain/repository/cart_repository.dart';

class AddCart {
  final CartRepository repository;

  AddCart(this.repository);

  Future<void> call(CartEntity product) async {
    repository.addCart(product);
  }
}
