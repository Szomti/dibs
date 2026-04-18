import 'package:dibs/features/categories/data/datasource/categories_remote_datasource.dart';
import 'package:dibs/features/categories/data/mappers/categories_mapper.dart';
import 'package:dibs/features/categories/domain/entities/categories.dart';

import '../../domain/repositories/categories_repository.dart';

final class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesRemoteDatasource _remoteDatasource;

  CategoriesRepositoryImpl(this._remoteDatasource);

  @override
  Future<Categories> getCategories() async {
    final categories = await _remoteDatasource.getCategories();
    return categories.toEntity();
  }
}
