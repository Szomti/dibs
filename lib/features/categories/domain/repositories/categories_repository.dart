import 'package:dibs/features/categories/domain/entities/categories.dart';

abstract class CategoriesRepository {
  Future<Categories> getCategories();
}
