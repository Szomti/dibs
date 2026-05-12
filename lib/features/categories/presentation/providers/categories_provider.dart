import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/categories.dart';
import '../../domain/entities/category.dart';
import 'categories_repository_provider.dart';

final categoriesProvider = FutureProvider<Categories>(
  (ref) async => ref.read(categoriesRepositoryProvider).getCategories(),
);

final categoryProvider = Provider.family<Category?, int>((ref, id) {
  final categories = ref.watch(categoriesProvider).value;
  return categories?.items.firstWhereOrNull((category) => category.id == id);
});
