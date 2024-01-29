import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

enum AuthStateEnum {
  login,
  logout,
}

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthStateEnum build() {
    return AuthStateEnum.logout;
  }

  void login() {
    state = AuthStateEnum.login;
  }

  void logout() {
    state = AuthStateEnum.logout;
  }
}
