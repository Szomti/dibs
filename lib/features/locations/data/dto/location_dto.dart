import 'package:meta/meta.dart';

@immutable
final class LocationDto {
  static const _idKey = 'id';
  static const _nameKey = 'name';
  static const _cityKey = 'city';
  static const _stateKey = 'state';
  static const _streetKey = 'street';
  static const _districtKey = 'district';
  static const _postalCodeKey = 'postal_code';
  static const _countryKey = 'country';
  static const _countryCodeKey = 'country_code';
  static const _buildingNumberKey = 'building_number';
  static const _apartmentNumberKey = 'apartment_number';
  static const _additionalInfoKey = 'additional_info';

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
  final String countryCode;
  final String? additionalInfo;

  const LocationDto._({
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
    required this.countryCode,
    required this.additionalInfo,
  });

  factory LocationDto.fromJson(Map<String, Object?> jsonObject) {
    return LocationDto._(
      id: jsonObject[_idKey] as int,
      name: jsonObject[_nameKey] as String,
      street: jsonObject[_streetKey] as String,
      district: jsonObject[_districtKey] as String?,
      state: jsonObject[_stateKey] as String?,
      city: jsonObject[_cityKey] as String,
      postalCode: jsonObject[_postalCodeKey] as String,
      country: jsonObject[_countryKey] as String,
      countryCode: jsonObject[_countryCodeKey] as String,
      buildingNumber: jsonObject[_buildingNumberKey] as String,
      apartmentNumber: jsonObject[_apartmentNumberKey] as String?,
      additionalInfo: jsonObject[_additionalInfoKey] as String?,
    );
  }

  Map<String, Object?> toJson() {
    return {
      _idKey: id,
      _nameKey: name,
      _streetKey: street,
      _districtKey: district,
      _stateKey: state,
      _cityKey: city,
      _postalCodeKey: postalCode,
      _countryKey: country,
      _countryCodeKey: countryCode,
      _buildingNumberKey: buildingNumber,
      _apartmentNumberKey: apartmentNumber,
      _additionalInfoKey: additionalInfo,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationDto &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
