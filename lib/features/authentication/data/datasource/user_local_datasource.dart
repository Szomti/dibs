import 'package:dibs/features/authentication/authentication.dart';

import '../../../../core/file_system/local_datasource.dart';

final class UserLocalDatasource extends LocalDatasource<UserDto> {
  UserLocalDatasource() : super(fileName: 'user');

  @override
  Future<UserDto?> read() async {
    final jsonObject = await readFromFile();
    if (jsonObject == null) return null;
    return UserDto.fromJson(jsonObject);
  }

  @override
  Future<void> write(UserDto userDto) async {
    await writeToFile(userDto.toJson());
  }
}
