import '../entities/categories.dart';

abstract class CategoriesRepository {
  Future<Categories> getCategories();
}
