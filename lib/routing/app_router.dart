import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/authentication.dart';
import '../features/authentication/presentation/providers/user_repository_provider.dart';
import '../features/categories/categories.dart';
import '../features/items/items.dart';
import '../features/locations/locations.dart';
import '../features/navigation_shell/navigation_shell.dart';
import '../features/settings/settings.dart';

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier(Stream<User?> stream) {
    stream.listen((_) => notifyListeners());
  }
}

final authChangeNotifierProvider = Provider<AuthChangeNotifier>((ref) {
  return AuthChangeNotifier(ref.read(userRepositoryProvider).userStream);
});

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouterProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.read(authChangeNotifierProvider);
  final repo = ref.read(userRepositoryProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    refreshListenable: authNotifier,
    redirect: (context, state) async {
      final user = await repo.getUser();
      final isLoggedIn = user != null;
      final isOnAuth = state.matchedLocation.startsWith('/auth');
      final isOnLoading = state.matchedLocation == '/';

      if (isLoggedIn && (isOnAuth || isOnLoading)) return '/app/categories';
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
                path: '/app/categories',
                builder: (_, _) => const CategoriesPage(),
                routes: [
                  GoRoute(
                    path: ':categoryId/locations',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (_, state) => LocationsPage(
                      categoryId: int.parse(
                        state.pathParameters['categoryId']!,
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: ':locationId/items',
                        parentNavigatorKey: _rootNavigatorKey,
                        builder: (_, state) => ItemsPage(
                          categoryId: int.parse(
                            state.pathParameters['categoryId']!,
                          ),
                          locationId: int.parse(
                            state.pathParameters['locationId']!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // TODO: Actual reservations screen
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/reservations',
                builder: (_, _) => const CategoriesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/settings',
                builder: (_, _) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
