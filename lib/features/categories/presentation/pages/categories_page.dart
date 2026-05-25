import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/app_dimensions.dart' as dims;
import '../../categories.dart';
import '../../domain/entities/categories.dart';
import '../providers/categories_provider.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: switch (categories) {
              AsyncLoading<Categories>() => const _CategoriesSkeletonList(),
              AsyncData<Categories>(:final value) => _CategoriesList(value),
              AsyncError<Categories>(:final error) => _CategoriesErrorMessage(
                error,
              ),
            },
          ),
        ],
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  final Categories categories;

  const _CategoriesList(this.categories);

  @override
  Widget build(BuildContext context) {
    if (categories.items.isEmpty) {
      return const Center(child: Text('No categories'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(dims.sizeMd),
      itemBuilder: (BuildContext context, int index) {
        return CategoryTile(categories.items.elementAt(index));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: dims.sizeSm);
      },
      itemCount: categories.items.length,
    );
  }
}

class _CategoriesSkeletonList extends StatelessWidget {
  const _CategoriesSkeletonList();

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.separated(
        padding: const EdgeInsets.all(dims.sizeMd),
        itemBuilder: (BuildContext context, int index) {
          return const CategoryTileBase(id: null, name: 'This is a skeleton');
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: dims.sizeSm);
        },
        itemCount: 15,
      ),
    );
  }
}

class _CategoriesErrorMessage extends StatelessWidget {
  final Object error;

  const _CategoriesErrorMessage(this.error);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Error occured\n$error'));
  }
}
