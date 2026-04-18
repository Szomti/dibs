final class CategoryDto {
  static const _idKey = 'id';
  static const _nameKey = 'name';
  static const _descriptionKey = 'description';

  final int id;
  final String name;
  final String? description;

  CategoryDto._({
    required this.id,
    required this.name,
    required this.description,
  });

  factory CategoryDto.fromJson(Map<String, Object?> jsonObject) {
    return CategoryDto._(
      id: jsonObject[_idKey] as int,
      name: jsonObject[_nameKey] as String,
      description: jsonObject[_descriptionKey] as String?,
    );
  }
}
