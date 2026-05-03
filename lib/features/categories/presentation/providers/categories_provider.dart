import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/categories.dart';
import 'categories_repository_provider.dart';

final categoriesProvider = FutureProvider<Categories>(
  (ref) async => ref.read(categoriesRepositoryProvider).getCategories(),
);
