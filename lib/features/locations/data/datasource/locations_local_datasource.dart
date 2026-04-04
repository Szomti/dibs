import 'package:dibs/core/file_system/local_datasource.dart';

import '../dto/locations_dto.dart';

class LocationsLocalDatasource extends LocalDatasource<LocationsDto> {
  LocationsLocalDatasource() : super(fileName: 'locations');

  @override
  Future<LocationsDto?> read() async {
    final jsonObject = await readFromFile();
    if (jsonObject == null || jsonObject.isEmpty) return null;
    return LocationsDto.fromJson(jsonObject);
  }

  @override
  Future<void> write(LocationsDto locationsDto) async {
    await writeToFile(locationsDto.toJson());
  }
}
