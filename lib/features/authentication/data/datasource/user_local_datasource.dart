import '../../../../core/file_system/local_datasource.dart';
import '../dto/user_dto.dart';

final class UserLocalDatasource extends LocalDatasource<UserDto> {
  UserLocalDatasource() : super(fileName: 'user');

  @override
  Future<UserDto?> read() async {
    final jsonObject = await readFromFile();
    if (jsonObject == null || jsonObject.isEmpty) return null;
    return UserDto.fromJson(jsonObject);
  }

  @override
  Future<void> write(UserDto userDto) async {
    await writeToFile(userDto.toJson());
  }
}
