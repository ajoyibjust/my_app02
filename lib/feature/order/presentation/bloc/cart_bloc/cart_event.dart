import 'package:my_app2/feature/order/domain/entities/cart_entity.dart';

abstract class CartEvent {}

class CartAdd extends CartEvent {
  final CartEntity product;
  CartAdd(this.product);
}

class CartGet extends CartEvent {}

class CartRemove extends CartEvent {
  final String id;

  CartRemove(this.id);
}

class CartCheck extends CartEvent {
  final String id;

  CartCheck(this.id);
}
