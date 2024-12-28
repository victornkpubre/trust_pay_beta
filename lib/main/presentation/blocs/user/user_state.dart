part of 'user_bloc.dart';

enum UserBlocStatus {
  initial,
  loading,
  userLoaded,
  usersLoaded,
  error
}

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(UserBlocStatus.initial) UserBlocStatus status,
    @Default(null) User? user,
    @Default(null) List<User>? users,
    @Default(null) List<User>? userSearchResults,
  }) = _Initial;
}