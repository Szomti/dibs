import 'package:dibs/features/authentication/authentication.dart';

extension UserDtoMapper on UserDto {
  User toEntity() {
    return User(username: username, email: email, token: token);
  }
}
