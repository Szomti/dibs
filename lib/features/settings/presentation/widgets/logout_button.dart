import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../authentication/presentation/providers/logout_provider.dart';

class LogoutButton extends ConsumerWidget {
  static const _snackBarTextStyle = TextStyle(color: Colors.white70);

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
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Logged out', style: _snackBarTextStyle),
          ),
        );
      case AsyncError<void>():
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Error occured', style: _snackBarTextStyle),
          ),
        );
    }
  }
}
