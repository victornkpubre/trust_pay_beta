part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.loadUser(int id, UserState state) = LoadUser;
  const factory UserEvent.getAllNotifications(UserState state) = GetAllNotifications;
  const factory UserEvent.currentUser(UserState state) = CurrentUser;
  const factory UserEvent.updateUser(User user,UserState state) = UpdateUser;
  const factory UserEvent.updateUserImage(int userId, File image, UserState state) = UpdateUserImage;
  const factory UserEvent.searchUsers(UserState state, String searchText, int pageSize, int page) = SearchUser;
  const factory UserEvent.walletDeposit(UserState state, double amount, int transactionId) = WalletDeposit;
  const factory UserEvent.walletWithdraw(UserState state, double amount, int transactionId) = WalletWithdraw;
  const factory UserEvent.getMediator(UserState state, User user, User bettor) = GetMediator;
  const factory UserEvent.getAllAccountHistory(UserState state, List<Account> accounts) = GetAllAccountHistory;
  const factory UserEvent.setFcmToken(UserState state, String token) = SetFcmToken;

  const factory UserEvent.getAccounts(UserState state, int userId) = GetAccounts;
  const factory UserEvent.initiateDeposit(UserState state, int amount, String currency) = InitiateDeposit;
  const factory UserEvent.checkPaymentStatus(UserState state, int paymentId) = CheckPaymentStatus;
}