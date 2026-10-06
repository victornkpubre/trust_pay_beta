part of 'user_bloc.dart';

enum UserBlocStatus {
  initial,
  loading,
  userLoaded,
  userUpdate,
  usersLoaded,
  notificationsLoaded,
  accountHistoryLoaded,
  accountsLoaded,
  depositInitiated,
  paymentPending,
  paymentSuccessful,
  paymentFailed,
  error
}

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(UserBlocStatus.initial) UserBlocStatus status,
    @Default(null) List<Notification>? allNotifications,
    @Default(null) List<AccountHistory>? accountHistory,
    @Default(null) User? user,
    @Default(null) User? mediator,
    @Default(null) String? message,
    @Default(null) List<User>? users,
    @Default(null) List<User>? userSearchResults,
    // Dual-wallet deposit flow — kept separate from `user.account` (which
    // stays the NGN wallet only, for backward compatibility everywhere else).
    @Default(null) List<Account>? accounts,
    @Default(null) String? checkoutLink,
    @Default(null) int? pendingPaymentId,
    @Default(null) PaymentStatus? paymentStatus,
  }) = _Initial;
}