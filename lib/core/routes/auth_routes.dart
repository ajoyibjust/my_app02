import 'package:go_router/go_router.dart';
import 'package:my_app2/feature/auth/screens/login.dart';
import 'package:my_app2/feature/auth/screens/register.dart';
import 'package:my_app2/feature/auth/screens/verification.dart';

final authRoutes = [
  GoRoute(path: "/register", builder: (context, state) => Register()),
  GoRoute(path: "/login", builder: (context, state) => Login()),
  GoRoute(path: "/verification", builder: (context, state) => Verification()),
];
