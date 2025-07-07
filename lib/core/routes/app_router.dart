import 'package:go_router/go_router.dart';
import 'package:my_app2/core/routes/auth_routes.dart';
import 'package:my_app2/core/routes/bottom_nav.dart';
import 'package:my_app2/core/routes/categories_routes.dart';
import 'package:my_app2/core/routes/favorites_routes.dart';
import 'package:my_app2/core/routes/home_routes.dart';
import 'package:my_app2/core/routes/profile_routes.dart';
import 'package:my_app2/core/routes/splash_router.dart';
import 'package:my_app2/feature/auth/screens/register.dart';
import 'package:my_app2/feature/home/domain/entities/product_entity.dart';
import 'package:my_app2/feature/home/presentation/screens/address_screen.dart';
import 'package:my_app2/feature/home/presentation/screens/payment_screen.dart';
import 'package:my_app2/feature/home/presentation/screens/product_screen.dart';
import 'package:my_app2/feature/home/presentation/screens/search/search.dart';
import 'package:my_app2/feature/home/presentation/screens/search/search_empty.dart';
import 'package:my_app2/feature/home/presentation/screens/search/search_not_empty.dart';
import 'package:my_app2/feature/order/presentation/screen/cart_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
     GoRoute(path: "/register", builder: (context, state) => Register()),
     GoRoute(path: "/cart", builder: (context, state) => CartScreen()),
     GoRoute(path: "/product", builder: (context, state) => ProductScreen(data: state.extra as ProductEntity,)),
     GoRoute(path: "/payment", builder: (context, state) => PaymentScreen()),
     GoRoute(path: "/search", builder: (context, state) => Search()),
     GoRoute(path: "/address", builder: (context, state) => AddressScreen()),
     GoRoute(path: "/searchEmpty", builder: (context, state) => SearchEmpty()),
     GoRoute(path: "/searchNotEmpty", builder: (context, state) => SearchNotEmpty()),
        ...splashRoutes,
        ...authRoutes,
    ShellRoute(
      builder: (context, state, child) {
        return BottomNav(child: child);
      },
      routes: [
        ...homeRoutes,
        ...categoriesRoutes,
        ...favoritesRoutes,
        ...profileRoutes,
      ],
    ),
  ],
);
