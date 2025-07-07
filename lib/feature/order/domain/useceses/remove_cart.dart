
import 'package:my_app2/feature/order/domain/repository/cart_repository.dart';

class RemoveCart {
  final CartRepository repository;

  RemoveCart(this.repository);

  Future<void> call(String id) async {
    return await repository.removeCart(id);
  }
}
