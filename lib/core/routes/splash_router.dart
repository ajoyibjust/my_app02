import 'package:go_router/go_router.dart';
import 'package:my_app2/feature/splash/screens/onbording.dart';
import 'package:my_app2/feature/splash/screens/onbording2.dart';
import 'package:my_app2/feature/splash/screens/onbording3.dart';
import 'package:my_app2/feature/splash/screens/splash_screen.dart';

final splashRoutes = [
  GoRoute(path: "/splash", builder: (context, state) => SplashScreen()),
  GoRoute(path: "/onbording", builder: (context, state) => Onbording()),
  GoRoute(path: "/onbording2", builder: (context, state) => Onbording2()),
  GoRoute(path: "/onbording3", builder: (context, state) => Onbording3()),
];
