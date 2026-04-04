import 'package:flutter/foundation.dart';

@immutable
final class Location {
  final int id;
  final String name;
  final String address;
  final String city;
  final String postalCode;
  final String country;

  const Location({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          address == other.address &&
          city == other.city &&
          postalCode == other.postalCode &&
          country == other.country;

  @override
  int get hashCode => Object.hash(id, name, address, city, postalCode, country);
}
