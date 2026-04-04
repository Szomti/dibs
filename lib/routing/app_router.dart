import 'package:dibs/features/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/presentation/providers/user_repository_provider.dart';
import '../features/locations/locations.dart';
import '../features/navigation_shell/navigation_shell.dart';

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier(Stream<User?> stream) {
    stream.listen((_) => notifyListeners());
  }
}

final authChangeNotifierProvider = Provider<AuthChangeNotifier>((ref) {
  return AuthChangeNotifier(ref.read(userRepositoryProvider).userStream);
});

final appRouterProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.read(authChangeNotifierProvider);
  final repo = ref.read(userRepositoryProvider);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: authNotifier,
    redirect: (context, state) async {
      final user = await repo.getUser();
      final isLoggedIn = user != null;
      final isOnAuth = state.matchedLocation.startsWith('/auth');
      final isOnLoading = state.matchedLocation == '/';

      if (isLoggedIn && (isOnAuth || isOnLoading)) return '/app/locations';
      if (!isLoggedIn && !isOnAuth) return '/auth/login';
      return null;
    },
    routes: [
      GoRoute(path: '/auth/login', builder: (_, _) => const LoginPage()),
      GoRoute(path: '/auth/register', builder: (_, _) => const RegisterPage()),
      StatefulShellRoute.indexedStack(
        builder: (_, _, navShell) => NavigationShellPage(navShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/locations',
                builder: (_, _) => const LocationsPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/locations',
                builder: (_, _) => const LocationsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
