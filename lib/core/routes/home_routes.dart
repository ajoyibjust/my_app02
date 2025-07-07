import 'package:go_router/go_router.dart';
import 'package:my_app2/feature/home/presentation/screens/home_screen.dart';

final homeRoutes = [
  GoRoute(path: "/", builder: (context, state) => HomeScreen()),
];
