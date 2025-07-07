import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app2/core/di/injection.dart' as di;
import 'package:my_app2/core/routes/app_router.dart';
import 'package:my_app2/feature/favorites/presentation/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:my_app2/feature/favorites/presentation/bloc/favorite_bloc/favorite_event.dart';
import 'package:my_app2/feature/home/data/repository/product_repository_impl.dart';
import 'package:my_app2/feature/home/data/source/product_remote_source.dart';
import 'package:my_app2/feature/home/domain/useceses/get_product.dart';
import 'package:my_app2/feature/home/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:my_app2/feature/home/presentation/blocs/product_bloc/product_event.dart';
import 'package:my_app2/feature/home/presentation/blocs/search_bloc/search_bloc.dart';
import 'package:my_app2/feature/home/presentation/provider/color_provider.dart';
import 'package:my_app2/feature/home/presentation/provider/home_switch_screen.dart';
import 'package:my_app2/feature/order/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:my_app2/feature/order/presentation/bloc/cart_bloc/cart_event.dart';
import 'package:my_app2/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  await Hive.openBox("favorite");
  await Hive.openBox("Cart");
  await di.init();

  final firestore = FirebaseFirestore.instance;
  final remoteDataSource = ProductRemoteDataSource(firestore);
  final repository = ProductRepositoryImpl(remoteDataSource);
  final getProducts = GetProducts(repository);

  runApp(MyApp(getProducts: getProducts));
}

class MyApp extends StatelessWidget {
  final GetProducts getProducts;

  const MyApp({super.key, required this.getProducts});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeTabProvider()),
        ChangeNotifierProvider(create: (context) => ColorProvider()),
        BlocProvider(
          create: (context) =>
              ProductBloc(getProducts)..add(LoadProductsEvent()),
        ),
        BlocProvider(create: (context) => SearchBloc(getProducts)),
        BlocProvider(
          create: (context) => FavoriteBloc(
            addFavorite: di.sl(),
            getFavorite: di.sl(),
            removeFavorite: di.sl(),
            isFavorite: di.sl(),
          )..add(FavoriteGet()),
        ),
        BlocProvider(
          create: (context) => CartBloc(
            addCart: di.sl(),
            getCart:  di.sl(),
            removeCart:  di.sl(),
            isCart:  di.sl(),
          )..add(CartGet())
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}
