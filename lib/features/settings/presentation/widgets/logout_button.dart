import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../authentication/presentation/providers/logout_provider.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logout = ref.watch(logoutProvider);
    ref.listen(logoutProvider, (prev, next) => _onLogout(next, context));
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            onPressed: logout.isLoading
                ? null
                : () => _confirmLogout(context, ref),
            child: const Text('Logout'),
          ),
        ),
      ],
    );
  }

  Future<void> _confirmLogout(BuildContext context, WidgetRef ref) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await ref.read(logoutProvider.notifier).logout();
                if (context.mounted) context.pop();
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _onLogout(AsyncValue<void> next, BuildContext context) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    switch (next) {
      case AsyncLoading<void>():
        break;
      case AsyncData<void>():
        scaffoldMessenger.showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
            content: Text(
              'Logged out',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
            ),
          ),
        );
      case AsyncError<void>():
        scaffoldMessenger.showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            content: Text(
              'Error occured',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
          ),
        );
    }
  }
}
