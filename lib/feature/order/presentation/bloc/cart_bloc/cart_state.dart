import 'package:my_app2/feature/order/domain/entities/cart_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartEntity> favorite;

  CartLoaded(this.favorite);
}

class CartStatus extends CartState {
  final bool isFavorite;

  CartStatus(this.isFavorite);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
