import 'package:flutter/foundation.dart';

@immutable
final class Location {
  final int id;
  final String name;
  final String street;
  final String buildingNumber;
  final String? apartmentNumber;
  final String postalCode;
  final String city;
  final String? district;
  final String? state;
  final String country;
  final String? additionalInfo;

  const Location({
    required this.id,
    required this.name,
    required this.street,
    required this.buildingNumber,
    required this.apartmentNumber,
    required this.postalCode,
    required this.city,
    required this.district,
    required this.state,
    required this.country,
    required this.additionalInfo,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
