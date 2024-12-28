part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  authenticated,
  error
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    @Default('') String token,
    @Default('') String errorMessage,
    @Default(null) User? user,
  }) = _Initial;
}