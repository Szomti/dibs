import 'package:dibs/core/constants/app_dimensions.dart';
import 'package:dibs/features/categories/presentation/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../categories.dart';
import '../../domain/entities/categories.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: sizeXs,
              horizontal: sizeMd,
            ),
            child: SearchBar(
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              hintText: 'Search categories',
            ),
          ),
          Expanded(
            child: switch (categories) {
              AsyncLoading<Categories>() => _createSkeletonList(),
              AsyncData<Categories>(:final value) => _createList(value),
              AsyncError<Categories>(:final error) => _createErrorInfo(error),
            },
          ),
        ],
      ),
    );
  }

  Widget _createList(Categories categories) {
    if (categories.items.isEmpty) {
      return const Center(child: Text('No categories'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(sizeMd),
      itemBuilder: (BuildContext context, int index) {
        return CategoryTile(categories.items.elementAt(index));
      },
      separatorBuilder: _createSeparator,
      itemCount: categories.items.length,
    );
  }

  Widget _createSkeletonList() {
    return Skeletonizer(
      child: ListView.separated(
        padding: const EdgeInsets.all(sizeMd),
        itemBuilder: (BuildContext context, int index) {
          return const CategoryTileBase(id: null, name: 'This is a skeleton');
        },
        separatorBuilder: _createSeparator,
        itemCount: 15,
      ),
    );
  }

  Widget _createSeparator(BuildContext context, int index) {
    return const SizedBox(height: sizeMd);
  }

  Widget _createErrorInfo(Object error) {
    return Center(child: Text('Error occured\n$error'));
  }
}
