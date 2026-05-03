import '../../authentication.dart';
import '../dto/user_local_dto.dart';
import '../dto/user_response_dto.dart';

extension UserLocalDtoMapper on UserLocalDto {
  User toEntity() {
    return User(name: name, email: email, token: token);
  }
}

extension UserResponseDtoMapper on UserResponseDto {
  User toEntity() {
    return User(name: name, email: email, token: token);
  }
}

extension UserToLocalDtoMapper on User {
  UserLocalDto toLocalDto() {
    return UserLocalDto(name: name, email: email, token: token);
  }
}
