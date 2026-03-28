import 'package:dibs/features/authentication/authentication.dart';
import 'package:go_router/go_router.dart';

import '../features/loading/loading.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingPage(),
      routes: [
        GoRoute(
          path: 'register',
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(path: 'login', builder: (context, state) => const LoginPage()),
      ],
    ),
  ],
);
