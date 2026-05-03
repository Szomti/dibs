import '../../domain/entities/categories.dart';
import '../../domain/repositories/categories_repository.dart';
import '../datasource/categories_remote_datasource.dart';
import '../mappers/categories_mapper.dart';

final class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesRemoteDatasource _remoteDatasource;

  CategoriesRepositoryImpl(this._remoteDatasource);

  @override
  Future<Categories> getCategories() async {
    final categories = await _remoteDatasource.getCategories();
    return categories.toEntity();
  }
}
