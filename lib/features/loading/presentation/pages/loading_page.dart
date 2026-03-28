import 'package:dibs/features/loading/presentation/providers/loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    ref.listen(loadingProvider, (_, next) {
      next.whenData(
        (LoadingDestination destination) => {
          switch (destination) {
            LoadingDestination.home => context.go('/register'),
            LoadingDestination.login => context.go('/login'),
          },
        },
      );
    });
    return const SafeArea(
      child: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
