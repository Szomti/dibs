import 'package:meta/meta.dart';

@immutable
final class SimplifiedItem {
  final int id;
  final String name;
  final String qrCode;
  final String? imageUrl;
  final String categoryName;
  final String locationName;

  const SimplifiedItem({
    required this.id,
    required this.name,
    required this.qrCode,
    required this.imageUrl,
    required this.categoryName,
    required this.locationName,
  });
}
