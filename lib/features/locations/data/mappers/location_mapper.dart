import '../../domain/entities/location.dart';
import '../dto/location_dto.dart';

extension LocationDtoMapper on LocationDto {
  Location toEntity() {
    return Location(
      id: id,
      name: name,
      city: city,
      postalCode: postalCode,
      country: country,
      countryCode: countryCode,
      street: street,
      buildingNumber: buildingNumber,
      apartmentNumber: apartmentNumber,
      district: district,
      state: state,
      additionalInfo: additionalInfo,
    );
  }
}
