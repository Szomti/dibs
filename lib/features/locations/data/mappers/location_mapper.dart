import 'package:dibs/features/locations/data/dto/location_dto.dart';
import 'package:dibs/features/locations/domain/entities/location.dart';

extension LocationDtoMapper on LocationDto {
  Location toEntity() {
    return Location(
      id: id,
      name: name,
      city: city,
      postalCode: postalCode,
      country: country,
      street: street,
      buildingNumber: buildingNumber,
      apartmentNumber: apartmentNumber,
      district: district,
      state: state,
      additionalInfo: additionalInfo,
    );
  }
}
