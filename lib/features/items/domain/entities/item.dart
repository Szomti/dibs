import 'package:flutter/foundation.dart';

import 'item_category.dart';
import 'item_location.dart';

@immutable
final class Item {
  final int id;
  final String name;
  final String? description;
  final String qrCode;
  final Uri? imageUrl;
  final ItemCategory category;
  final ItemLocation location;
  final bool isAvailable;

  const Item({
    required this.id,
    required this.name,
    required this.description,
    required this.qrCode,
    required this.imageUrl,
    required this.category,
    required this.location,
    required this.isAvailable,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
