// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  UserState get state => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEventCopyWith<UserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
  @useResult
  $Res call({UserState state});

  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
    ) as $Val);
  }

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStateCopyWith<$Res> get state {
    return $UserStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoadUserImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$LoadUserImplCopyWith(
          _$LoadUserImpl value, $Res Function(_$LoadUserImpl) then) =
      __$$LoadUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, UserState state});

  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$LoadUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$LoadUserImpl>
    implements _$$LoadUserImplCopyWith<$Res> {
  __$$LoadUserImplCopyWithImpl(
      _$LoadUserImpl _value, $Res Function(_$LoadUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? state = null,
  }) {
    return _then(_$LoadUserImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
    ));
  }
}

/// @nodoc

class _$LoadUserImpl implements LoadUser {
  const _$LoadUserImpl(this.id, this.state);

  @override
  final int id;
  @override
  final UserState state;

  @override
  String toString() {
    return 'UserEvent.loadUser(id: $id, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, state);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadUserImplCopyWith<_$LoadUserImpl> get copyWith =>
      __$$LoadUserImplCopyWithImpl<_$LoadUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return loadUser(id, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return loadUser?.call(id, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser(id, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return loadUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return loadUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser(this);
    }
    return orElse();
  }
}

abstract class LoadUser implements UserEvent {
  const factory LoadUser(final int id, final UserState state) = _$LoadUserImpl;

  int get id;
  @override
  UserState get state;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadUserImplCopyWith<_$LoadUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAllNotificationsImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$GetAllNotificationsImplCopyWith(_$GetAllNotificationsImpl value,
          $Res Function(_$GetAllNotificationsImpl) then) =
      __$$GetAllNotificationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserState state});

  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$GetAllNotificationsImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetAllNotificationsImpl>
    implements _$$GetAllNotificationsImplCopyWith<$Res> {
  __$$GetAllNotificationsImplCopyWithImpl(_$GetAllNotificationsImpl _value,
      $Res Function(_$GetAllNotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$GetAllNotificationsImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
    ));
  }
}

/// @nodoc

class _$GetAllNotificationsImpl implements GetAllNotifications {
  const _$GetAllNotificationsImpl(this.state);

  @override
  final UserState state;

  @override
  String toString() {
    return 'UserEvent.getAllNotifications(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllNotificationsImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllNotificationsImplCopyWith<_$GetAllNotificationsImpl> get copyWith =>
      __$$GetAllNotificationsImplCopyWithImpl<_$GetAllNotificationsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return getAllNotifications(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return getAllNotifications?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (getAllNotifications != null) {
      return getAllNotifications(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return getAllNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return getAllNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (getAllNotifications != null) {
      return getAllNotifications(this);
    }
    return orElse();
  }
}

abstract class GetAllNotifications implements UserEvent {
  const factory GetAllNotifications(final UserState state) =
      _$GetAllNotificationsImpl;

  @override
  UserState get state;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllNotificationsImplCopyWith<_$GetAllNotificationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CurrentUserImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$CurrentUserImplCopyWith(
          _$CurrentUserImpl value, $Res Function(_$CurrentUserImpl) then) =
      __$$CurrentUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserState state});

  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$CurrentUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$CurrentUserImpl>
    implements _$$CurrentUserImplCopyWith<$Res> {
  __$$CurrentUserImplCopyWithImpl(
      _$CurrentUserImpl _value, $Res Function(_$CurrentUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
  }) {
    return _then(_$CurrentUserImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
    ));
  }
}

/// @nodoc

class _$CurrentUserImpl implements CurrentUser {
  const _$CurrentUserImpl(this.state);

  @override
  final UserState state;

  @override
  String toString() {
    return 'UserEvent.currentUser(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentUserImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentUserImplCopyWith<_$CurrentUserImpl> get copyWith =>
      __$$CurrentUserImplCopyWithImpl<_$CurrentUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return currentUser(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return currentUser?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (currentUser != null) {
      return currentUser(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return currentUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return currentUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (currentUser != null) {
      return currentUser(this);
    }
    return orElse();
  }
}

abstract class CurrentUser implements UserEvent {
  const factory CurrentUser(final UserState state) = _$CurrentUserImpl;

  @override
  UserState get state;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentUserImplCopyWith<_$CurrentUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$UpdateUserImplCopyWith(
          _$UpdateUserImpl value, $Res Function(_$UpdateUserImpl) then) =
      __$$UpdateUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, UserState state});

  $UserCopyWith<$Res> get user;
  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$UpdateUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UpdateUserImpl>
    implements _$$UpdateUserImplCopyWith<$Res> {
  __$$UpdateUserImplCopyWithImpl(
      _$UpdateUserImpl _value, $Res Function(_$UpdateUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? state = null,
  }) {
    return _then(_$UpdateUserImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
    ));
  }

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UpdateUserImpl implements UpdateUser {
  const _$UpdateUserImpl(this.user, this.state);

  @override
  final User user;
  @override
  final UserState state;

  @override
  String toString() {
    return 'UserEvent.updateUser(user: $user, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, state);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserImplCopyWith<_$UpdateUserImpl> get copyWith =>
      __$$UpdateUserImplCopyWithImpl<_$UpdateUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return updateUser(user, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return updateUser?.call(user, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(user, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class UpdateUser implements UserEvent {
  const factory UpdateUser(final User user, final UserState state) =
      _$UpdateUserImpl;

  User get user;
  @override
  UserState get state;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserImplCopyWith<_$UpdateUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserImageImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$UpdateUserImageImplCopyWith(_$UpdateUserImageImpl value,
          $Res Function(_$UpdateUserImageImpl) then) =
      __$$UpdateUserImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, File image, UserState state});

  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$UpdateUserImageImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UpdateUserImageImpl>
    implements _$$UpdateUserImageImplCopyWith<$Res> {
  __$$UpdateUserImageImplCopyWithImpl(
      _$UpdateUserImageImpl _value, $Res Function(_$UpdateUserImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? image = null,
    Object? state = null,
  }) {
    return _then(_$UpdateUserImageImpl(
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
    ));
  }
}

/// @nodoc

class _$UpdateUserImageImpl implements UpdateUserImage {
  const _$UpdateUserImageImpl(this.userId, this.image, this.state);

  @override
  final int userId;
  @override
  final File image;
  @override
  final UserState state;

  @override
  String toString() {
    return 'UserEvent.updateUserImage(userId: $userId, image: $image, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserImageImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, image, state);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserImageImplCopyWith<_$UpdateUserImageImpl> get copyWith =>
      __$$UpdateUserImageImplCopyWithImpl<_$UpdateUserImageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return updateUserImage(userId, image, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return updateUserImage?.call(userId, image, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (updateUserImage != null) {
      return updateUserImage(userId, image, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return updateUserImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return updateUserImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (updateUserImage != null) {
      return updateUserImage(this);
    }
    return orElse();
  }
}

abstract class UpdateUserImage implements UserEvent {
  const factory UpdateUserImage(
          final int userId, final File image, final UserState state) =
      _$UpdateUserImageImpl;

  int get userId;
  File get image;
  @override
  UserState get state;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserImageImplCopyWith<_$UpdateUserImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchUserImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$SearchUserImplCopyWith(
          _$SearchUserImpl value, $Res Function(_$SearchUserImpl) then) =
      __$$SearchUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserState state, String searchText, int pageSize, int page});

  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$SearchUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$SearchUserImpl>
    implements _$$SearchUserImplCopyWith<$Res> {
  __$$SearchUserImplCopyWithImpl(
      _$SearchUserImpl _value, $Res Function(_$SearchUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? searchText = null,
    Object? pageSize = null,
    Object? page = null,
  }) {
    return _then(_$SearchUserImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
      null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchUserImpl implements SearchUser {
  const _$SearchUserImpl(this.state, this.searchText, this.pageSize, this.page);

  @override
  final UserState state;
  @override
  final String searchText;
  @override
  final int pageSize;
  @override
  final int page;

  @override
  String toString() {
    return 'UserEvent.searchUsers(state: $state, searchText: $searchText, pageSize: $pageSize, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, state, searchText, pageSize, page);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUserImplCopyWith<_$SearchUserImpl> get copyWith =>
      __$$SearchUserImplCopyWithImpl<_$SearchUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return searchUsers(state, searchText, pageSize, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return searchUsers?.call(state, searchText, pageSize, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (searchUsers != null) {
      return searchUsers(state, searchText, pageSize, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return searchUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return searchUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (searchUsers != null) {
      return searchUsers(this);
    }
    return orElse();
  }
}

abstract class SearchUser implements UserEvent {
  const factory SearchUser(final UserState state, final String searchText,
      final int pageSize, final int page) = _$SearchUserImpl;

  @override
  UserState get state;
  String get searchText;
  int get pageSize;
  int get page;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchUserImplCopyWith<_$SearchUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletDepositImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$WalletDepositImplCopyWith(
          _$WalletDepositImpl value, $Res Function(_$WalletDepositImpl) then) =
      __$$WalletDepositImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserState state, double amount, int transactionId});

  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$WalletDepositImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$WalletDepositImpl>
    implements _$$WalletDepositImplCopyWith<$Res> {
  __$$WalletDepositImplCopyWithImpl(
      _$WalletDepositImpl _value, $Res Function(_$WalletDepositImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? amount = null,
    Object? transactionId = null,
  }) {
    return _then(_$WalletDepositImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WalletDepositImpl implements WalletDeposit {
  const _$WalletDepositImpl(this.state, this.amount, this.transactionId);

  @override
  final UserState state;
  @override
  final double amount;
  @override
  final int transactionId;

  @override
  String toString() {
    return 'UserEvent.walletDeposit(state: $state, amount: $amount, transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletDepositImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, amount, transactionId);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletDepositImplCopyWith<_$WalletDepositImpl> get copyWith =>
      __$$WalletDepositImplCopyWithImpl<_$WalletDepositImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return walletDeposit(state, amount, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return walletDeposit?.call(state, amount, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (walletDeposit != null) {
      return walletDeposit(state, amount, transactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return walletDeposit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return walletDeposit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (walletDeposit != null) {
      return walletDeposit(this);
    }
    return orElse();
  }
}

abstract class WalletDeposit implements UserEvent {
  const factory WalletDeposit(
          final UserState state, final double amount, final int transactionId) =
      _$WalletDepositImpl;

  @override
  UserState get state;
  double get amount;
  int get transactionId;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletDepositImplCopyWith<_$WalletDepositImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletWithdrawImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$WalletWithdrawImplCopyWith(_$WalletWithdrawImpl value,
          $Res Function(_$WalletWithdrawImpl) then) =
      __$$WalletWithdrawImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserState state, double amount, int transactionId});

  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$WalletWithdrawImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$WalletWithdrawImpl>
    implements _$$WalletWithdrawImplCopyWith<$Res> {
  __$$WalletWithdrawImplCopyWithImpl(
      _$WalletWithdrawImpl _value, $Res Function(_$WalletWithdrawImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? amount = null,
    Object? transactionId = null,
  }) {
    return _then(_$WalletWithdrawImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WalletWithdrawImpl implements WalletWithdraw {
  const _$WalletWithdrawImpl(this.state, this.amount, this.transactionId);

  @override
  final UserState state;
  @override
  final double amount;
  @override
  final int transactionId;

  @override
  String toString() {
    return 'UserEvent.walletWithdraw(state: $state, amount: $amount, transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletWithdrawImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, amount, transactionId);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletWithdrawImplCopyWith<_$WalletWithdrawImpl> get copyWith =>
      __$$WalletWithdrawImplCopyWithImpl<_$WalletWithdrawImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return walletWithdraw(state, amount, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return walletWithdraw?.call(state, amount, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (walletWithdraw != null) {
      return walletWithdraw(state, amount, transactionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return walletWithdraw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return walletWithdraw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (walletWithdraw != null) {
      return walletWithdraw(this);
    }
    return orElse();
  }
}

abstract class WalletWithdraw implements UserEvent {
  const factory WalletWithdraw(
          final UserState state, final double amount, final int transactionId) =
      _$WalletWithdrawImpl;

  @override
  UserState get state;
  double get amount;
  int get transactionId;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletWithdrawImplCopyWith<_$WalletWithdrawImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetMediatorImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$GetMediatorImplCopyWith(
          _$GetMediatorImpl value, $Res Function(_$GetMediatorImpl) then) =
      __$$GetMediatorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserState state, User user, User bettor});

  @override
  $UserStateCopyWith<$Res> get state;
  $UserCopyWith<$Res> get user;
  $UserCopyWith<$Res> get bettor;
}

/// @nodoc
class __$$GetMediatorImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetMediatorImpl>
    implements _$$GetMediatorImplCopyWith<$Res> {
  __$$GetMediatorImplCopyWithImpl(
      _$GetMediatorImpl _value, $Res Function(_$GetMediatorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? user = null,
    Object? bettor = null,
  }) {
    return _then(_$GetMediatorImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      null == bettor
          ? _value.bettor
          : bettor // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get bettor {
    return $UserCopyWith<$Res>(_value.bettor, (value) {
      return _then(_value.copyWith(bettor: value));
    });
  }
}

/// @nodoc

class _$GetMediatorImpl implements GetMediator {
  const _$GetMediatorImpl(this.state, this.user, this.bettor);

  @override
  final UserState state;
  @override
  final User user;
  @override
  final User bettor;

  @override
  String toString() {
    return 'UserEvent.getMediator(state: $state, user: $user, bettor: $bettor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMediatorImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.bettor, bettor) || other.bettor == bettor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, user, bettor);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMediatorImplCopyWith<_$GetMediatorImpl> get copyWith =>
      __$$GetMediatorImplCopyWithImpl<_$GetMediatorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return getMediator(state, user, bettor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return getMediator?.call(state, user, bettor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (getMediator != null) {
      return getMediator(state, user, bettor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return getMediator(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return getMediator?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (getMediator != null) {
      return getMediator(this);
    }
    return orElse();
  }
}

abstract class GetMediator implements UserEvent {
  const factory GetMediator(
          final UserState state, final User user, final User bettor) =
      _$GetMediatorImpl;

  @override
  UserState get state;
  User get user;
  User get bettor;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetMediatorImplCopyWith<_$GetMediatorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAllAccountHistoryImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$GetAllAccountHistoryImplCopyWith(_$GetAllAccountHistoryImpl value,
          $Res Function(_$GetAllAccountHistoryImpl) then) =
      __$$GetAllAccountHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserState state, List<Account> accounts});

  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$GetAllAccountHistoryImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetAllAccountHistoryImpl>
    implements _$$GetAllAccountHistoryImplCopyWith<$Res> {
  __$$GetAllAccountHistoryImplCopyWithImpl(_$GetAllAccountHistoryImpl _value,
      $Res Function(_$GetAllAccountHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? accounts = null,
  }) {
    return _then(_$GetAllAccountHistoryImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
      null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ));
  }
}

/// @nodoc

class _$GetAllAccountHistoryImpl implements GetAllAccountHistory {
  const _$GetAllAccountHistoryImpl(this.state, final List<Account> accounts)
      : _accounts = accounts;

  @override
  final UserState state;
  final List<Account> _accounts;
  @override
  List<Account> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString() {
    return 'UserEvent.getAllAccountHistory(state: $state, accounts: $accounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllAccountHistoryImpl &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, state, const DeepCollectionEquality().hash(_accounts));

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllAccountHistoryImplCopyWith<_$GetAllAccountHistoryImpl>
      get copyWith =>
          __$$GetAllAccountHistoryImplCopyWithImpl<_$GetAllAccountHistoryImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return getAllAccountHistory(state, accounts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return getAllAccountHistory?.call(state, accounts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (getAllAccountHistory != null) {
      return getAllAccountHistory(state, accounts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return getAllAccountHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return getAllAccountHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (getAllAccountHistory != null) {
      return getAllAccountHistory(this);
    }
    return orElse();
  }
}

abstract class GetAllAccountHistory implements UserEvent {
  const factory GetAllAccountHistory(
          final UserState state, final List<Account> accounts) =
      _$GetAllAccountHistoryImpl;

  @override
  UserState get state;
  List<Account> get accounts;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllAccountHistoryImplCopyWith<_$GetAllAccountHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetFcmTokenImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$SetFcmTokenImplCopyWith(
          _$SetFcmTokenImpl value, $Res Function(_$SetFcmTokenImpl) then) =
      __$$SetFcmTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserState state, String token});

  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$SetFcmTokenImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$SetFcmTokenImpl>
    implements _$$SetFcmTokenImplCopyWith<$Res> {
  __$$SetFcmTokenImplCopyWithImpl(
      _$SetFcmTokenImpl _value, $Res Function(_$SetFcmTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? token = null,
  }) {
    return _then(_$SetFcmTokenImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetFcmTokenImpl implements SetFcmToken {
  const _$SetFcmTokenImpl(this.state, this.token);

  @override
  final UserState state;
  @override
  final String token;

  @override
  String toString() {
    return 'UserEvent.setFcmToken(state: $state, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetFcmTokenImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, token);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetFcmTokenImplCopyWith<_$SetFcmTokenImpl> get copyWith =>
      __$$SetFcmTokenImplCopyWithImpl<_$SetFcmTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return setFcmToken(state, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return setFcmToken?.call(state, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (setFcmToken != null) {
      return setFcmToken(state, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return setFcmToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return setFcmToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (setFcmToken != null) {
      return setFcmToken(this);
    }
    return orElse();
  }
}

abstract class SetFcmToken implements UserEvent {
  const factory SetFcmToken(final UserState state, final String token) =
      _$SetFcmTokenImpl;

  @override
  UserState get state;
  String get token;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetFcmTokenImplCopyWith<_$SetFcmTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAccountsImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$GetAccountsImplCopyWith(
          _$GetAccountsImpl value, $Res Function(_$GetAccountsImpl) then) =
      __$$GetAccountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserState state, int userId});

  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$GetAccountsImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetAccountsImpl>
    implements _$$GetAccountsImplCopyWith<$Res> {
  __$$GetAccountsImplCopyWithImpl(
      _$GetAccountsImpl _value, $Res Function(_$GetAccountsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? userId = null,
  }) {
    return _then(_$GetAccountsImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
      null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetAccountsImpl implements GetAccounts {
  const _$GetAccountsImpl(this.state, this.userId);

  @override
  final UserState state;
  @override
  final int userId;

  @override
  String toString() {
    return 'UserEvent.getAccounts(state: $state, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAccountsImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, userId);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAccountsImplCopyWith<_$GetAccountsImpl> get copyWith =>
      __$$GetAccountsImplCopyWithImpl<_$GetAccountsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return getAccounts(state, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return getAccounts?.call(state, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (getAccounts != null) {
      return getAccounts(state, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return getAccounts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return getAccounts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (getAccounts != null) {
      return getAccounts(this);
    }
    return orElse();
  }
}

abstract class GetAccounts implements UserEvent {
  const factory GetAccounts(final UserState state, final int userId) =
      _$GetAccountsImpl;

  @override
  UserState get state;
  int get userId;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAccountsImplCopyWith<_$GetAccountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitiateDepositImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$InitiateDepositImplCopyWith(_$InitiateDepositImpl value,
          $Res Function(_$InitiateDepositImpl) then) =
      __$$InitiateDepositImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserState state, int amount, String currency});

  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$InitiateDepositImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$InitiateDepositImpl>
    implements _$$InitiateDepositImplCopyWith<$Res> {
  __$$InitiateDepositImplCopyWithImpl(
      _$InitiateDepositImpl _value, $Res Function(_$InitiateDepositImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? amount = null,
    Object? currency = null,
  }) {
    return _then(_$InitiateDepositImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitiateDepositImpl implements InitiateDeposit {
  const _$InitiateDepositImpl(this.state, this.amount, this.currency);

  @override
  final UserState state;
  @override
  final int amount;
  @override
  final String currency;

  @override
  String toString() {
    return 'UserEvent.initiateDeposit(state: $state, amount: $amount, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitiateDepositImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, amount, currency);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitiateDepositImplCopyWith<_$InitiateDepositImpl> get copyWith =>
      __$$InitiateDepositImplCopyWithImpl<_$InitiateDepositImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return initiateDeposit(state, amount, currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return initiateDeposit?.call(state, amount, currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (initiateDeposit != null) {
      return initiateDeposit(state, amount, currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return initiateDeposit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return initiateDeposit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (initiateDeposit != null) {
      return initiateDeposit(this);
    }
    return orElse();
  }
}

abstract class InitiateDeposit implements UserEvent {
  const factory InitiateDeposit(
          final UserState state, final int amount, final String currency) =
      _$InitiateDepositImpl;

  @override
  UserState get state;
  int get amount;
  String get currency;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitiateDepositImplCopyWith<_$InitiateDepositImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckPaymentStatusImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$CheckPaymentStatusImplCopyWith(_$CheckPaymentStatusImpl value,
          $Res Function(_$CheckPaymentStatusImpl) then) =
      __$$CheckPaymentStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserState state, int paymentId});

  @override
  $UserStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$CheckPaymentStatusImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$CheckPaymentStatusImpl>
    implements _$$CheckPaymentStatusImplCopyWith<$Res> {
  __$$CheckPaymentStatusImplCopyWithImpl(_$CheckPaymentStatusImpl _value,
      $Res Function(_$CheckPaymentStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? paymentId = null,
  }) {
    return _then(_$CheckPaymentStatusImpl(
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as UserState,
      null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CheckPaymentStatusImpl implements CheckPaymentStatus {
  const _$CheckPaymentStatusImpl(this.state, this.paymentId);

  @override
  final UserState state;
  @override
  final int paymentId;

  @override
  String toString() {
    return 'UserEvent.checkPaymentStatus(state: $state, paymentId: $paymentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckPaymentStatusImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, paymentId);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckPaymentStatusImplCopyWith<_$CheckPaymentStatusImpl> get copyWith =>
      __$$CheckPaymentStatusImplCopyWithImpl<_$CheckPaymentStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, UserState state) loadUser,
    required TResult Function(UserState state) getAllNotifications,
    required TResult Function(UserState state) currentUser,
    required TResult Function(User user, UserState state) updateUser,
    required TResult Function(int userId, File image, UserState state)
        updateUserImage,
    required TResult Function(
            UserState state, String searchText, int pageSize, int page)
        searchUsers,
    required TResult Function(UserState state, double amount, int transactionId)
        walletDeposit,
    required TResult Function(UserState state, double amount, int transactionId)
        walletWithdraw,
    required TResult Function(UserState state, User user, User bettor)
        getMediator,
    required TResult Function(UserState state, List<Account> accounts)
        getAllAccountHistory,
    required TResult Function(UserState state, String token) setFcmToken,
    required TResult Function(UserState state, int userId) getAccounts,
    required TResult Function(UserState state, int amount, String currency)
        initiateDeposit,
    required TResult Function(UserState state, int paymentId)
        checkPaymentStatus,
  }) {
    return checkPaymentStatus(state, paymentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, UserState state)? loadUser,
    TResult? Function(UserState state)? getAllNotifications,
    TResult? Function(UserState state)? currentUser,
    TResult? Function(User user, UserState state)? updateUser,
    TResult? Function(int userId, File image, UserState state)? updateUserImage,
    TResult? Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult? Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult? Function(UserState state, User user, User bettor)? getMediator,
    TResult? Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult? Function(UserState state, String token)? setFcmToken,
    TResult? Function(UserState state, int userId)? getAccounts,
    TResult? Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult? Function(UserState state, int paymentId)? checkPaymentStatus,
  }) {
    return checkPaymentStatus?.call(state, paymentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, UserState state)? loadUser,
    TResult Function(UserState state)? getAllNotifications,
    TResult Function(UserState state)? currentUser,
    TResult Function(User user, UserState state)? updateUser,
    TResult Function(int userId, File image, UserState state)? updateUserImage,
    TResult Function(
            UserState state, String searchText, int pageSize, int page)?
        searchUsers,
    TResult Function(UserState state, double amount, int transactionId)?
        walletDeposit,
    TResult Function(UserState state, double amount, int transactionId)?
        walletWithdraw,
    TResult Function(UserState state, User user, User bettor)? getMediator,
    TResult Function(UserState state, List<Account> accounts)?
        getAllAccountHistory,
    TResult Function(UserState state, String token)? setFcmToken,
    TResult Function(UserState state, int userId)? getAccounts,
    TResult Function(UserState state, int amount, String currency)?
        initiateDeposit,
    TResult Function(UserState state, int paymentId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (checkPaymentStatus != null) {
      return checkPaymentStatus(state, paymentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUser value) loadUser,
    required TResult Function(GetAllNotifications value) getAllNotifications,
    required TResult Function(CurrentUser value) currentUser,
    required TResult Function(UpdateUser value) updateUser,
    required TResult Function(UpdateUserImage value) updateUserImage,
    required TResult Function(SearchUser value) searchUsers,
    required TResult Function(WalletDeposit value) walletDeposit,
    required TResult Function(WalletWithdraw value) walletWithdraw,
    required TResult Function(GetMediator value) getMediator,
    required TResult Function(GetAllAccountHistory value) getAllAccountHistory,
    required TResult Function(SetFcmToken value) setFcmToken,
    required TResult Function(GetAccounts value) getAccounts,
    required TResult Function(InitiateDeposit value) initiateDeposit,
    required TResult Function(CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return checkPaymentStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUser value)? loadUser,
    TResult? Function(GetAllNotifications value)? getAllNotifications,
    TResult? Function(CurrentUser value)? currentUser,
    TResult? Function(UpdateUser value)? updateUser,
    TResult? Function(UpdateUserImage value)? updateUserImage,
    TResult? Function(SearchUser value)? searchUsers,
    TResult? Function(WalletDeposit value)? walletDeposit,
    TResult? Function(WalletWithdraw value)? walletWithdraw,
    TResult? Function(GetMediator value)? getMediator,
    TResult? Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult? Function(SetFcmToken value)? setFcmToken,
    TResult? Function(GetAccounts value)? getAccounts,
    TResult? Function(InitiateDeposit value)? initiateDeposit,
    TResult? Function(CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return checkPaymentStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUser value)? loadUser,
    TResult Function(GetAllNotifications value)? getAllNotifications,
    TResult Function(CurrentUser value)? currentUser,
    TResult Function(UpdateUser value)? updateUser,
    TResult Function(UpdateUserImage value)? updateUserImage,
    TResult Function(SearchUser value)? searchUsers,
    TResult Function(WalletDeposit value)? walletDeposit,
    TResult Function(WalletWithdraw value)? walletWithdraw,
    TResult Function(GetMediator value)? getMediator,
    TResult Function(GetAllAccountHistory value)? getAllAccountHistory,
    TResult Function(SetFcmToken value)? setFcmToken,
    TResult Function(GetAccounts value)? getAccounts,
    TResult Function(InitiateDeposit value)? initiateDeposit,
    TResult Function(CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (checkPaymentStatus != null) {
      return checkPaymentStatus(this);
    }
    return orElse();
  }
}

abstract class CheckPaymentStatus implements UserEvent {
  const factory CheckPaymentStatus(final UserState state, final int paymentId) =
      _$CheckPaymentStatusImpl;

  @override
  UserState get state;
  int get paymentId;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckPaymentStatusImplCopyWith<_$CheckPaymentStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  UserBlocStatus get status => throw _privateConstructorUsedError;
  List<Notification>? get allNotifications =>
      throw _privateConstructorUsedError;
  List<AccountHistory>? get accountHistory =>
      throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  User? get mediator => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<User>? get users => throw _privateConstructorUsedError;
  List<User>? get userSearchResults =>
      throw _privateConstructorUsedError; // Dual-wallet deposit flow — kept separate from `user.account` (which
// stays the NGN wallet only, for backward compatibility everywhere else).
  List<Account>? get accounts => throw _privateConstructorUsedError;
  String? get checkoutLink => throw _privateConstructorUsedError;
  int? get pendingPaymentId => throw _privateConstructorUsedError;
  PaymentStatus? get paymentStatus => throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {UserBlocStatus status,
      List<Notification>? allNotifications,
      List<AccountHistory>? accountHistory,
      User? user,
      User? mediator,
      String? message,
      List<User>? users,
      List<User>? userSearchResults,
      List<Account>? accounts,
      String? checkoutLink,
      int? pendingPaymentId,
      PaymentStatus? paymentStatus});

  $UserCopyWith<$Res>? get user;
  $UserCopyWith<$Res>? get mediator;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? allNotifications = freezed,
    Object? accountHistory = freezed,
    Object? user = freezed,
    Object? mediator = freezed,
    Object? message = freezed,
    Object? users = freezed,
    Object? userSearchResults = freezed,
    Object? accounts = freezed,
    Object? checkoutLink = freezed,
    Object? pendingPaymentId = freezed,
    Object? paymentStatus = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserBlocStatus,
      allNotifications: freezed == allNotifications
          ? _value.allNotifications
          : allNotifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>?,
      accountHistory: freezed == accountHistory
          ? _value.accountHistory
          : accountHistory // ignore: cast_nullable_to_non_nullable
              as List<AccountHistory>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      mediator: freezed == mediator
          ? _value.mediator
          : mediator // ignore: cast_nullable_to_non_nullable
              as User?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      userSearchResults: freezed == userSearchResults
          ? _value.userSearchResults
          : userSearchResults // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      accounts: freezed == accounts
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>?,
      checkoutLink: freezed == checkoutLink
          ? _value.checkoutLink
          : checkoutLink // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingPaymentId: freezed == pendingPaymentId
          ? _value.pendingPaymentId
          : pendingPaymentId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus?,
    ) as $Val);
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get mediator {
    if (_value.mediator == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.mediator!, (value) {
      return _then(_value.copyWith(mediator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserBlocStatus status,
      List<Notification>? allNotifications,
      List<AccountHistory>? accountHistory,
      User? user,
      User? mediator,
      String? message,
      List<User>? users,
      List<User>? userSearchResults,
      List<Account>? accounts,
      String? checkoutLink,
      int? pendingPaymentId,
      PaymentStatus? paymentStatus});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $UserCopyWith<$Res>? get mediator;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? allNotifications = freezed,
    Object? accountHistory = freezed,
    Object? user = freezed,
    Object? mediator = freezed,
    Object? message = freezed,
    Object? users = freezed,
    Object? userSearchResults = freezed,
    Object? accounts = freezed,
    Object? checkoutLink = freezed,
    Object? pendingPaymentId = freezed,
    Object? paymentStatus = freezed,
  }) {
    return _then(_$InitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserBlocStatus,
      allNotifications: freezed == allNotifications
          ? _value._allNotifications
          : allNotifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>?,
      accountHistory: freezed == accountHistory
          ? _value._accountHistory
          : accountHistory // ignore: cast_nullable_to_non_nullable
              as List<AccountHistory>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      mediator: freezed == mediator
          ? _value.mediator
          : mediator // ignore: cast_nullable_to_non_nullable
              as User?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      userSearchResults: freezed == userSearchResults
          ? _value._userSearchResults
          : userSearchResults // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      accounts: freezed == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>?,
      checkoutLink: freezed == checkoutLink
          ? _value.checkoutLink
          : checkoutLink // ignore: cast_nullable_to_non_nullable
              as String?,
      pendingPaymentId: freezed == pendingPaymentId
          ? _value.pendingPaymentId
          : pendingPaymentId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.status = UserBlocStatus.initial,
      final List<Notification>? allNotifications = null,
      final List<AccountHistory>? accountHistory = null,
      this.user = null,
      this.mediator = null,
      this.message = null,
      final List<User>? users = null,
      final List<User>? userSearchResults = null,
      final List<Account>? accounts = null,
      this.checkoutLink = null,
      this.pendingPaymentId = null,
      this.paymentStatus = null})
      : _allNotifications = allNotifications,
        _accountHistory = accountHistory,
        _users = users,
        _userSearchResults = userSearchResults,
        _accounts = accounts;

  @override
  @JsonKey()
  final UserBlocStatus status;
  final List<Notification>? _allNotifications;
  @override
  @JsonKey()
  List<Notification>? get allNotifications {
    final value = _allNotifications;
    if (value == null) return null;
    if (_allNotifications is EqualUnmodifiableListView)
      return _allNotifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AccountHistory>? _accountHistory;
  @override
  @JsonKey()
  List<AccountHistory>? get accountHistory {
    final value = _accountHistory;
    if (value == null) return null;
    if (_accountHistory is EqualUnmodifiableListView) return _accountHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final User? user;
  @override
  @JsonKey()
  final User? mediator;
  @override
  @JsonKey()
  final String? message;
  final List<User>? _users;
  @override
  @JsonKey()
  List<User>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<User>? _userSearchResults;
  @override
  @JsonKey()
  List<User>? get userSearchResults {
    final value = _userSearchResults;
    if (value == null) return null;
    if (_userSearchResults is EqualUnmodifiableListView)
      return _userSearchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// Dual-wallet deposit flow — kept separate from `user.account` (which
// stays the NGN wallet only, for backward compatibility everywhere else).
  final List<Account>? _accounts;
// Dual-wallet deposit flow — kept separate from `user.account` (which
// stays the NGN wallet only, for backward compatibility everywhere else).
  @override
  @JsonKey()
  List<Account>? get accounts {
    final value = _accounts;
    if (value == null) return null;
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String? checkoutLink;
  @override
  @JsonKey()
  final int? pendingPaymentId;
  @override
  @JsonKey()
  final PaymentStatus? paymentStatus;

  @override
  String toString() {
    return 'UserState(status: $status, allNotifications: $allNotifications, accountHistory: $accountHistory, user: $user, mediator: $mediator, message: $message, users: $users, userSearchResults: $userSearchResults, accounts: $accounts, checkoutLink: $checkoutLink, pendingPaymentId: $pendingPaymentId, paymentStatus: $paymentStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._allNotifications, _allNotifications) &&
            const DeepCollectionEquality()
                .equals(other._accountHistory, _accountHistory) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.mediator, mediator) ||
                other.mediator == mediator) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality()
                .equals(other._userSearchResults, _userSearchResults) &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.checkoutLink, checkoutLink) ||
                other.checkoutLink == checkoutLink) &&
            (identical(other.pendingPaymentId, pendingPaymentId) ||
                other.pendingPaymentId == pendingPaymentId) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_allNotifications),
      const DeepCollectionEquality().hash(_accountHistory),
      user,
      mediator,
      message,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_userSearchResults),
      const DeepCollectionEquality().hash(_accounts),
      checkoutLink,
      pendingPaymentId,
      paymentStatus);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements UserState {
  const factory _Initial(
      {final UserBlocStatus status,
      final List<Notification>? allNotifications,
      final List<AccountHistory>? accountHistory,
      final User? user,
      final User? mediator,
      final String? message,
      final List<User>? users,
      final List<User>? userSearchResults,
      final List<Account>? accounts,
      final String? checkoutLink,
      final int? pendingPaymentId,
      final PaymentStatus? paymentStatus}) = _$InitialImpl;

  @override
  UserBlocStatus get status;
  @override
  List<Notification>? get allNotifications;
  @override
  List<AccountHistory>? get accountHistory;
  @override
  User? get user;
  @override
  User? get mediator;
  @override
  String? get message;
  @override
  List<User>? get users;
  @override
  List<User>?
      get userSearchResults; // Dual-wallet deposit flow — kept separate from `user.account` (which
// stays the NGN wallet only, for backward compatibility everywhere else).
  @override
  List<Account>? get accounts;
  @override
  String? get checkoutLink;
  @override
  int? get pendingPaymentId;
  @override
  PaymentStatus? get paymentStatus;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
