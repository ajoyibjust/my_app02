import 'package:go_router/go_router.dart';
import 'package:my_app2/feature/favorites/presentation/screens/favorites_screen.dart';

final favoritesRoutes = [
  GoRoute(path: "/favorites", builder: (context, state) => FavoritesScreen()),
];
