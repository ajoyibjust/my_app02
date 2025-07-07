import 'package:go_router/go_router.dart';
import 'package:my_app2/feature/order/presentation/screen/order_screen.dart';

final categoriesRoutes = [
  GoRoute(path: "/order", builder: (context, state) => OrderScreen()),
];
