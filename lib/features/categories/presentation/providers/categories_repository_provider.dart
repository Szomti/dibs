import 'package:dibs/core/network/dio_provider.dart';
import 'package:dibs/features/categories/data/datasource/categories_remote_datasource.dart';
import 'package:dibs/features/categories/data/repositories/categories_repository_impl.dart';
import 'package:dibs/features/categories/domain/repositories/categories_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesRepositoryProvider = Provider<CategoriesRepository>(
  (ref) => CategoriesRepositoryImpl(
    CategoriesRemoteDatasource(ref.watch(dioProvider)),
  ),
);
