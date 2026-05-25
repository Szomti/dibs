import 'package:meta/meta.dart';

@immutable
final class SimplifiedItemDto {
  static const _idKey = 'id';
  static const _nameKey = 'name';
  static const _qrCodeKey = 'qr_code';
  static const _imageUrlKey = 'image_url';
  static const _categoryNameKey = 'category_name';
  static const _locationNameKey = 'location_name';

  final int id;
  final String name;
  final String qrCode;
  final String? imageUrl;
  final String categoryName;
  final String locationName;

  const SimplifiedItemDto({
    required this.id,
    required this.name,
    required this.qrCode,
    required this.imageUrl,
    required this.categoryName,
    required this.locationName,
  });

  factory SimplifiedItemDto.fromJson(Map<String, Object?> jsonObject) {
    return SimplifiedItemDto(
      id: jsonObject[_idKey] as int,
      name: jsonObject[_nameKey] as String,
      qrCode: jsonObject[_qrCodeKey] as String,
      imageUrl: jsonObject[_imageUrlKey] as String?,
      categoryName: jsonObject[_categoryNameKey] as String,
      locationName: jsonObject[_locationNameKey] as String,
    );
  }
}
