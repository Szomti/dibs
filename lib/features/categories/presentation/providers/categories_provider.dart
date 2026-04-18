import 'package:dibs/features/categories/domain/entities/categories.dart';
import 'package:dibs/features/categories/presentation/providers/categories_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider = FutureProvider<Categories>(
  (ref) async => ref.read(categoriesRepositoryProvider).getCategories(),
);
