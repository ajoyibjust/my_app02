
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app2/feature/order/domain/useceses/add_cart.dart';
import 'package:my_app2/feature/order/domain/useceses/get_cart.dart';
import 'package:my_app2/feature/order/domain/useceses/is_cart.dart';
import 'package:my_app2/feature/order/domain/useceses/remove_cart.dart';
import 'package:my_app2/feature/order/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:my_app2/feature/order/presentation/bloc/cart_bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddCart addCart;
  final GetCart getCart;
  final RemoveCart removeCart;
  final IsCart isCart;

  CartBloc({
    required this.addCart,
    required this.getCart,
    required this.removeCart,
    required this.isCart,
  }) : super(CartInitial()) {
    on<CartAdd>(_add);
    on<CartGet>(_get);
    on<CartRemove>(_remove);
    on<CartCheck>(_isCart);
  }
  Future<void> _add(CartAdd event, Emitter<CartState> emit) async {
    await addCart(event.product);
    add(CartGet());
  }

  Future<void> _get(CartGet event, Emitter<CartState> emit) async {
    final favorites = await getCart();
    emit(CartLoaded(favorites));
  }

  Future<void> _remove(
    CartRemove event,
    Emitter<CartState> emit,
  ) async {
    await removeCart(event.id);
    add(CartGet());
  }
  Future<void> _isCart(CartCheck event, Emitter<CartState> emit) async {
    final res = await isCart(event.id);
    emit(CartStatus(res));
  }
}
