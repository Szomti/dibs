import 'package:meta/meta.dart';

import 'item_category_dto.dart';
import 'item_location_dto.dart';

@immutable
final class ItemDto {
  static const _idKey = 'id';
  static const _nameKey = 'name';
  static const _descriptionKey = 'description';
  static const _qrCodeKey = 'qr_code';
  static const _imageUrlKey = 'image_url';
  static const _categoryKey = 'category';
  static const _locationKey = 'location';
  static const _isAvailableKey = 'is_available';

  final int id;
  final String name;
  final String? description;
  final String qrCode;
  final Uri? imageUrl;
  final ItemCategoryDto category;
  final ItemLocationDto location;
  final bool isAvailable;

  const ItemDto({
    required this.id,
    required this.name,
    required this.description,
    required this.qrCode,
    required this.imageUrl,
    required this.category,
    required this.location,
    required this.isAvailable,
  });

  factory ItemDto.fromJson(Map<String, Object?> jsonObject) {
    final imageUrl = jsonObject[_imageUrlKey] as String?;
    return ItemDto(
      id: jsonObject[_idKey] as int,
      name: jsonObject[_nameKey] as String,
      description: jsonObject[_descriptionKey] as String?,
      qrCode: jsonObject[_qrCodeKey] as String,
      imageUrl: imageUrl == null ? null : Uri.tryParse(imageUrl),
      category: ItemCategoryDto.fromJson(
        jsonObject[_categoryKey] as Map<String, Object?>,
      ),
      location: ItemLocationDto.fromJson(
        jsonObject[_locationKey] as Map<String, Object?>,
      ),
      isAvailable: jsonObject[_isAvailableKey] as bool,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemDto && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
