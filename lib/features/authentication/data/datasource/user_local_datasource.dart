import '../../../../core/file_system/local_datasource.dart';
import '../dto/user_local_dto.dart';

final class UserLocalDatasource extends LocalDatasource<UserLocalDto> {
  UserLocalDatasource() : super(fileName: 'user');

  @override
  Future<UserLocalDto?> read() async {
    final jsonObject = await readFromFile();
    if (jsonObject == null || jsonObject.isEmpty) return null;
    return UserLocalDto.fromJson(jsonObject);
  }

  @override
  Future<void> write(UserLocalDto userDto) async {
    await writeToFile(userDto.toJson());
  }
}
