class LocationDto {
  static const _idKey = 'id';
  static const _nameKey = 'name';
  static const _addressKey = 'address';
  static const _cityKey = 'city';
  static const _postalCodeKey = 'postalCode';
  static const _countryKey = 'country';

  final int id;
  final String name;
  final String address;
  final String city;
  final String postalCode;
  final String country;

  LocationDto._({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  factory LocationDto.fromJson(Map<String, Object?> jsonObject) {
    return LocationDto._(
      id: jsonObject[_idKey] as int,
      name: jsonObject[_nameKey] as String,
      address: jsonObject[_addressKey] as String,
      city: jsonObject[_cityKey] as String,
      postalCode: jsonObject[_postalCodeKey] as String,
      country: jsonObject[_countryKey] as String,
    );
  }

  Map<String, Object?> toJson() {
    return {
      _idKey: id,
      _nameKey: name,
      _addressKey: address,
      _cityKey: city,
      _postalCodeKey: postalCode,
      _countryKey: country,
    };
  }
}
