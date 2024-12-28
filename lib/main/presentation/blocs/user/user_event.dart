part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.loadUser(int id) = _LoadUser;
  const factory UserEvent.currentUser() = _CurrentUser;
  // const factory UserEvent.getStatistics(User user) = _GetStatistics;
  const factory UserEvent.searchUsers(String searchText, int pageSize, int page) = _SearchUser;
}