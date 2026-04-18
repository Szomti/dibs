import 'package:dibs/core/constants/app_dimensions.dart' as dims;
import 'package:dibs/features/authentication/domain/entities/user.dart';
import 'package:dibs/features/authentication/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserInfo extends ConsumerWidget {
  static const _namePlaceholder = 'Username';
  static const _emailPlaceholder = 'username@example.com';

  const UserInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(dims.sizeMd),
        child: switch (user) {
          AsyncLoading<User?>() => const Skeletonizer(
            child: _UserCard(name: _namePlaceholder, email: _emailPlaceholder),
          ),
          AsyncData<User?>(:final value) =>
            (value != null)
                ? _UserCard(name: value.name, email: value.email)
                : const _TextLine('Missing User'),
          AsyncError<User?>(:final error) => _TextLine('$error'),
        },
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  final String name;
  final String email;

  const _UserCard({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Symbols.account_circle_filled_rounded, size: dims.sizeXxl),
        const SizedBox(width: dims.sizeSm),
        Expanded(
          child: Column(
            children: [_TextLine('Name: $name'), _TextLine('Email: $email')],
          ),
        ),
      ],
    );
  }
}

class _TextLine extends StatelessWidget {
  final String text;

  const _TextLine(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(children: [Expanded(child: Text(text))]);
  }
}
