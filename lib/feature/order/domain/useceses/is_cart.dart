import 'package:my_app2/feature/order/domain/repository/cart_repository.dart';

class IsCart {
  final CartRepository repository;

  IsCart(this.repository);

  Future<bool> call(String id) async {
    return await repository.isCart(id);
  }
}
