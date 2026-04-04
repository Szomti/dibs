import 'package:dibs/features/locations/data/dto/location_dto.dart';
import 'package:dibs/features/locations/domain/entities/location.dart';

extension LocationDtoMapper on LocationDto {
  Location toEntity() {
    return Location(
      id: id,
      name: name,
      address: address,
      city: city,
      postalCode: postalCode,
      country: country,
    );
  }
}
