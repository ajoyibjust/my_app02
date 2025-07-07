
import 'package:get_it/get_it.dart';
import 'package:my_app2/feature/favorites/data/repositories/favorites_repositories_impl.dart';
import 'package:my_app2/feature/favorites/data/source/favorite_local_source.dart';
import 'package:my_app2/feature/favorites/domain/repository/favorites_repository.dart';
import 'package:my_app2/feature/favorites/domain/useceses/add_favorite.dart';
import 'package:my_app2/feature/favorites/domain/useceses/get_favorite.dart';
import 'package:my_app2/feature/favorites/domain/useceses/is_favorite.dart';
import 'package:my_app2/feature/favorites/domain/useceses/remove_favorite.dart';
import 'package:my_app2/feature/order/data/repositories/cart_repositories_impl.dart';
import 'package:my_app2/feature/order/data/source/cart_local_source.dart';
import 'package:my_app2/feature/order/domain/repository/cart_repository.dart';
import 'package:my_app2/feature/order/domain/useceses/add_cart.dart';
import 'package:my_app2/feature/order/domain/useceses/get_cart.dart';
import 'package:my_app2/feature/order/domain/useceses/is_cart.dart';
import 'package:my_app2/feature/order/domain/useceses/remove_cart.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //? favorite

  sl.registerLazySingleton<FavoritesLocalSource>(
    () => FavoritesLocalSourceimpl(),
  );

  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(local: sl()),
  );

  sl.registerLazySingleton(() => AddFavorite(sl()));
  sl.registerLazySingleton(() => GetFavorite(sl()));
  sl.registerLazySingleton(() => RemoveFavorite(sl()));
  sl.registerLazySingleton(() => IsFavorite(sl()));

  //? cart

    sl.registerLazySingleton<CartLocalSource>(
    () => CartLocalSourceImpl(),
  );

  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoriesImpl(local: sl()),
  );

  sl.registerLazySingleton(() => AddCart(sl()));
  sl.registerLazySingleton(() => GetCart(sl()));
  sl.registerLazySingleton(() => RemoveCart(sl()));
  sl.registerLazySingleton(() => IsCart(sl()));
}
