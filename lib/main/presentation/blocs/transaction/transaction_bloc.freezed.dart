// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionEventCopyWith<$Res> {
  factory $TransactionEventCopyWith(
          TransactionEvent value, $Res Function(TransactionEvent) then) =
      _$TransactionEventCopyWithImpl<$Res, TransactionEvent>;
}

/// @nodoc
class _$TransactionEventCopyWithImpl<$Res, $Val extends TransactionEvent>
    implements $TransactionEventCopyWith<$Res> {
  _$TransactionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetTransactionImplCopyWith<$Res> {
  factory _$$GetTransactionImplCopyWith(_$GetTransactionImpl value,
          $Res Function(_$GetTransactionImpl) then) =
      __$$GetTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, TransactionBlocState state});

  $TransactionBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$GetTransactionImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$GetTransactionImpl>
    implements _$$GetTransactionImplCopyWith<$Res> {
  __$$GetTransactionImplCopyWithImpl(
      _$GetTransactionImpl _value, $Res Function(_$GetTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? state = null,
  }) {
    return _then(_$GetTransactionImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get state {
    return $TransactionBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$GetTransactionImpl implements GetTransaction {
  const _$GetTransactionImpl(this.id, this.state);

  @override
  final int id;
  @override
  final TransactionBlocState state;

  @override
  String toString() {
    return 'TransactionEvent.getTransaction(id: $id, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, state);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTransactionImplCopyWith<_$GetTransactionImpl> get copyWith =>
      __$$GetTransactionImplCopyWithImpl<_$GetTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return getTransaction(id, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return getTransaction?.call(id, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (getTransaction != null) {
      return getTransaction(id, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return getTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return getTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (getTransaction != null) {
      return getTransaction(this);
    }
    return orElse();
  }
}

abstract class GetTransaction implements TransactionEvent {
  const factory GetTransaction(final int id, final TransactionBlocState state) =
      _$GetTransactionImpl;

  int get id;
  TransactionBlocState get state;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTransactionImplCopyWith<_$GetTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchTransactionImplCopyWith<$Res> {
  factory _$$SearchTransactionImplCopyWith(_$SearchTransactionImpl value,
          $Res Function(_$SearchTransactionImpl) then) =
      __$$SearchTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text, int pageSize, int page, TransactionBlocState state});

  $TransactionBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$SearchTransactionImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$SearchTransactionImpl>
    implements _$$SearchTransactionImplCopyWith<$Res> {
  __$$SearchTransactionImplCopyWithImpl(_$SearchTransactionImpl _value,
      $Res Function(_$SearchTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? pageSize = null,
    Object? page = null,
    Object? state = null,
  }) {
    return _then(_$SearchTransactionImpl(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get state {
    return $TransactionBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$SearchTransactionImpl implements SearchTransaction {
  const _$SearchTransactionImpl(
      this.text, this.pageSize, this.page, this.state);

  @override
  final String text;
  @override
  final int pageSize;
  @override
  final int page;
  @override
  final TransactionBlocState state;

  @override
  String toString() {
    return 'TransactionEvent.searchTransaction(text: $text, pageSize: $pageSize, page: $page, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTransactionImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, pageSize, page, state);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTransactionImplCopyWith<_$SearchTransactionImpl> get copyWith =>
      __$$SearchTransactionImplCopyWithImpl<_$SearchTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return searchTransaction(text, pageSize, page, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return searchTransaction?.call(text, pageSize, page, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (searchTransaction != null) {
      return searchTransaction(text, pageSize, page, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return searchTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return searchTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (searchTransaction != null) {
      return searchTransaction(this);
    }
    return orElse();
  }
}

abstract class SearchTransaction implements TransactionEvent {
  const factory SearchTransaction(
      final String text,
      final int pageSize,
      final int page,
      final TransactionBlocState state) = _$SearchTransactionImpl;

  String get text;
  int get pageSize;
  int get page;
  TransactionBlocState get state;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchTransactionImplCopyWith<_$SearchTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadUserHistoryImplCopyWith<$Res> {
  factory _$$LoadUserHistoryImplCopyWith(_$LoadUserHistoryImpl value,
          $Res Function(_$LoadUserHistoryImpl) then) =
      __$$LoadUserHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, int pageSize, int page, TransactionBlocState state});

  $TransactionBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$LoadUserHistoryImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$LoadUserHistoryImpl>
    implements _$$LoadUserHistoryImplCopyWith<$Res> {
  __$$LoadUserHistoryImplCopyWithImpl(
      _$LoadUserHistoryImpl _value, $Res Function(_$LoadUserHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pageSize = null,
    Object? page = null,
    Object? state = null,
  }) {
    return _then(_$LoadUserHistoryImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get state {
    return $TransactionBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$LoadUserHistoryImpl implements LoadUserHistory {
  const _$LoadUserHistoryImpl(this.id, this.pageSize, this.page, this.state);

  @override
  final int id;
  @override
  final int pageSize;
  @override
  final int page;
  @override
  final TransactionBlocState state;

  @override
  String toString() {
    return 'TransactionEvent.getUsersHistory(id: $id, pageSize: $pageSize, page: $page, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUserHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, pageSize, page, state);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadUserHistoryImplCopyWith<_$LoadUserHistoryImpl> get copyWith =>
      __$$LoadUserHistoryImplCopyWithImpl<_$LoadUserHistoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return getUsersHistory(id, pageSize, page, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return getUsersHistory?.call(id, pageSize, page, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (getUsersHistory != null) {
      return getUsersHistory(id, pageSize, page, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return getUsersHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return getUsersHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (getUsersHistory != null) {
      return getUsersHistory(this);
    }
    return orElse();
  }
}

abstract class LoadUserHistory implements TransactionEvent {
  const factory LoadUserHistory(final int id, final int pageSize,
      final int page, final TransactionBlocState state) = _$LoadUserHistoryImpl;

  int get id;
  int get pageSize;
  int get page;
  TransactionBlocState get state;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadUserHistoryImplCopyWith<_$LoadUserHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTransactionImplCopyWith<$Res> {
  factory _$$CreateTransactionImplCopyWith(_$CreateTransactionImpl value,
          $Res Function(_$CreateTransactionImpl) then) =
      __$$CreateTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Transaction transaction,
      TransactionBlocState state,
      File? mediationSource});

  $TransactionCopyWith<$Res> get transaction;
  $TransactionBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$CreateTransactionImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$CreateTransactionImpl>
    implements _$$CreateTransactionImplCopyWith<$Res> {
  __$$CreateTransactionImplCopyWithImpl(_$CreateTransactionImpl _value,
      $Res Function(_$CreateTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? state = null,
    Object? mediationSource = freezed,
  }) {
    return _then(_$CreateTransactionImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
      freezed == mediationSource
          ? _value.mediationSource
          : mediationSource // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get state {
    return $TransactionBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$CreateTransactionImpl implements CreateTransaction {
  const _$CreateTransactionImpl(
      this.transaction, this.state, this.mediationSource);

  @override
  final Transaction transaction;
  @override
  final TransactionBlocState state;
  @override
  final File? mediationSource;

  @override
  String toString() {
    return 'TransactionEvent.createTransaction(transaction: $transaction, state: $state, mediationSource: $mediationSource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransactionImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.mediationSource, mediationSource) ||
                other.mediationSource == mediationSource));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, transaction, state, mediationSource);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTransactionImplCopyWith<_$CreateTransactionImpl> get copyWith =>
      __$$CreateTransactionImplCopyWithImpl<_$CreateTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return createTransaction(transaction, state, mediationSource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return createTransaction?.call(transaction, state, mediationSource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (createTransaction != null) {
      return createTransaction(transaction, state, mediationSource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return createTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return createTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (createTransaction != null) {
      return createTransaction(this);
    }
    return orElse();
  }
}

abstract class CreateTransaction implements TransactionEvent {
  const factory CreateTransaction(
      final Transaction transaction,
      final TransactionBlocState state,
      final File? mediationSource) = _$CreateTransactionImpl;

  Transaction get transaction;
  TransactionBlocState get state;
  File? get mediationSource;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTransactionImplCopyWith<_$CreateTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTransactionImplCopyWith<$Res> {
  factory _$$UpdateTransactionImplCopyWith(_$UpdateTransactionImpl value,
          $Res Function(_$UpdateTransactionImpl) then) =
      __$$UpdateTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Transaction transaction, TransactionBlocState state});

  $TransactionCopyWith<$Res> get transaction;
  $TransactionBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$UpdateTransactionImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$UpdateTransactionImpl>
    implements _$$UpdateTransactionImplCopyWith<$Res> {
  __$$UpdateTransactionImplCopyWithImpl(_$UpdateTransactionImpl _value,
      $Res Function(_$UpdateTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? state = null,
  }) {
    return _then(_$UpdateTransactionImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get state {
    return $TransactionBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$UpdateTransactionImpl implements UpdateTransaction {
  const _$UpdateTransactionImpl(this.transaction, this.state);

  @override
  final Transaction transaction;
  @override
  final TransactionBlocState state;

  @override
  String toString() {
    return 'TransactionEvent.updateTransaction(transaction: $transaction, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTransactionImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction, state);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTransactionImplCopyWith<_$UpdateTransactionImpl> get copyWith =>
      __$$UpdateTransactionImplCopyWithImpl<_$UpdateTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return updateTransaction(transaction, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return updateTransaction?.call(transaction, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (updateTransaction != null) {
      return updateTransaction(transaction, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return updateTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return updateTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (updateTransaction != null) {
      return updateTransaction(this);
    }
    return orElse();
  }
}

abstract class UpdateTransaction implements TransactionEvent {
  const factory UpdateTransaction(
          final Transaction transaction, final TransactionBlocState state) =
      _$UpdateTransactionImpl;

  Transaction get transaction;
  TransactionBlocState get state;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTransactionImplCopyWith<_$UpdateTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetObligationsTokenImplCopyWith<$Res> {
  factory _$$SetObligationsTokenImplCopyWith(_$SetObligationsTokenImpl value,
          $Res Function(_$SetObligationsTokenImpl) then) =
      __$$SetObligationsTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Transaction transaction,
      int obligationId,
      String token,
      TransactionBlocState state});

  $TransactionCopyWith<$Res> get transaction;
  $TransactionBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$SetObligationsTokenImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$SetObligationsTokenImpl>
    implements _$$SetObligationsTokenImplCopyWith<$Res> {
  __$$SetObligationsTokenImplCopyWithImpl(_$SetObligationsTokenImpl _value,
      $Res Function(_$SetObligationsTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? obligationId = null,
    Object? token = null,
    Object? state = null,
  }) {
    return _then(_$SetObligationsTokenImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == obligationId
          ? _value.obligationId
          : obligationId // ignore: cast_nullable_to_non_nullable
              as int,
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get state {
    return $TransactionBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$SetObligationsTokenImpl implements SetObligationsToken {
  const _$SetObligationsTokenImpl(
      this.transaction, this.obligationId, this.token, this.state);

  @override
  final Transaction transaction;
  @override
  final int obligationId;
  @override
  final String token;
  @override
  final TransactionBlocState state;

  @override
  String toString() {
    return 'TransactionEvent.setObligationsToken(transaction: $transaction, obligationId: $obligationId, token: $token, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetObligationsTokenImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.obligationId, obligationId) ||
                other.obligationId == obligationId) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, transaction, obligationId, token, state);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetObligationsTokenImplCopyWith<_$SetObligationsTokenImpl> get copyWith =>
      __$$SetObligationsTokenImplCopyWithImpl<_$SetObligationsTokenImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return setObligationsToken(transaction, obligationId, token, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return setObligationsToken?.call(transaction, obligationId, token, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (setObligationsToken != null) {
      return setObligationsToken(transaction, obligationId, token, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return setObligationsToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return setObligationsToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (setObligationsToken != null) {
      return setObligationsToken(this);
    }
    return orElse();
  }
}

abstract class SetObligationsToken implements TransactionEvent {
  const factory SetObligationsToken(
      final Transaction transaction,
      final int obligationId,
      final String token,
      final TransactionBlocState state) = _$SetObligationsTokenImpl;

  Transaction get transaction;
  int get obligationId;
  String get token;
  TransactionBlocState get state;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetObligationsTokenImplCopyWith<_$SetObligationsTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetObligationStatusImplCopyWith<$Res> {
  factory _$$SetObligationStatusImplCopyWith(_$SetObligationStatusImpl value,
          $Res Function(_$SetObligationStatusImpl) then) =
      __$$SetObligationStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Transaction transaction,
      int obligationId,
      ObligationStatus status,
      TransactionBlocState state});

  $TransactionCopyWith<$Res> get transaction;
  $TransactionBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$SetObligationStatusImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$SetObligationStatusImpl>
    implements _$$SetObligationStatusImplCopyWith<$Res> {
  __$$SetObligationStatusImplCopyWithImpl(_$SetObligationStatusImpl _value,
      $Res Function(_$SetObligationStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? obligationId = null,
    Object? status = null,
    Object? state = null,
  }) {
    return _then(_$SetObligationStatusImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == obligationId
          ? _value.obligationId
          : obligationId // ignore: cast_nullable_to_non_nullable
              as int,
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ObligationStatus,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get state {
    return $TransactionBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$SetObligationStatusImpl implements SetObligationStatus {
  const _$SetObligationStatusImpl(
      this.transaction, this.obligationId, this.status, this.state);

  @override
  final Transaction transaction;
  @override
  final int obligationId;
  @override
  final ObligationStatus status;
  @override
  final TransactionBlocState state;

  @override
  String toString() {
    return 'TransactionEvent.setObligationStatus(transaction: $transaction, obligationId: $obligationId, status: $status, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetObligationStatusImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.obligationId, obligationId) ||
                other.obligationId == obligationId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, transaction, obligationId, status, state);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetObligationStatusImplCopyWith<_$SetObligationStatusImpl> get copyWith =>
      __$$SetObligationStatusImplCopyWithImpl<_$SetObligationStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return setObligationStatus(transaction, obligationId, status, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return setObligationStatus?.call(transaction, obligationId, status, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (setObligationStatus != null) {
      return setObligationStatus(transaction, obligationId, status, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return setObligationStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return setObligationStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (setObligationStatus != null) {
      return setObligationStatus(this);
    }
    return orElse();
  }
}

abstract class SetObligationStatus implements TransactionEvent {
  const factory SetObligationStatus(
      final Transaction transaction,
      final int obligationId,
      final ObligationStatus status,
      final TransactionBlocState state) = _$SetObligationStatusImpl;

  Transaction get transaction;
  int get obligationId;
  ObligationStatus get status;
  TransactionBlocState get state;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetObligationStatusImplCopyWith<_$SetObligationStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddObligationImplCopyWith<$Res> {
  factory _$$AddObligationImplCopyWith(
          _$AddObligationImpl value, $Res Function(_$AddObligationImpl) then) =
      __$$AddObligationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int obligationId, TransactionBlocState state});

  $TransactionBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$AddObligationImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$AddObligationImpl>
    implements _$$AddObligationImplCopyWith<$Res> {
  __$$AddObligationImplCopyWithImpl(
      _$AddObligationImpl _value, $Res Function(_$AddObligationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? obligationId = null,
    Object? state = null,
  }) {
    return _then(_$AddObligationImpl(
      null == obligationId
          ? _value.obligationId
          : obligationId // ignore: cast_nullable_to_non_nullable
              as int,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get state {
    return $TransactionBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$AddObligationImpl implements AddObligation {
  const _$AddObligationImpl(this.obligationId, this.state);

  @override
  final int obligationId;
  @override
  final TransactionBlocState state;

  @override
  String toString() {
    return 'TransactionEvent.addObligation(obligationId: $obligationId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddObligationImpl &&
            (identical(other.obligationId, obligationId) ||
                other.obligationId == obligationId) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, obligationId, state);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddObligationImplCopyWith<_$AddObligationImpl> get copyWith =>
      __$$AddObligationImplCopyWithImpl<_$AddObligationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return addObligation(obligationId, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return addObligation?.call(obligationId, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (addObligation != null) {
      return addObligation(obligationId, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return addObligation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return addObligation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (addObligation != null) {
      return addObligation(this);
    }
    return orElse();
  }
}

abstract class AddObligation implements TransactionEvent {
  const factory AddObligation(
          final int obligationId, final TransactionBlocState state) =
      _$AddObligationImpl;

  int get obligationId;
  TransactionBlocState get state;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddObligationImplCopyWith<_$AddObligationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotifyMembersImplCopyWith<$Res> {
  factory _$$NotifyMembersImplCopyWith(
          _$NotifyMembersImpl value, $Res Function(_$NotifyMembersImpl) then) =
      __$$NotifyMembersImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Transaction transaction,
      User user,
      String message,
      TransactionBlocState state});

  $TransactionCopyWith<$Res> get transaction;
  $UserCopyWith<$Res> get user;
  $TransactionBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$NotifyMembersImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$NotifyMembersImpl>
    implements _$$NotifyMembersImplCopyWith<$Res> {
  __$$NotifyMembersImplCopyWithImpl(
      _$NotifyMembersImpl _value, $Res Function(_$NotifyMembersImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
    Object? user = null,
    Object? message = null,
    Object? state = null,
  }) {
    return _then(_$NotifyMembersImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get state {
    return $TransactionBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$NotifyMembersImpl implements NotifyMembers {
  const _$NotifyMembersImpl(
      this.transaction, this.user, this.message, this.state);

  @override
  final Transaction transaction;
  @override
  final User user;
  @override
  final String message;
  @override
  final TransactionBlocState state;

  @override
  String toString() {
    return 'TransactionEvent.initialNotification(transaction: $transaction, user: $user, message: $message, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotifyMembersImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, transaction, user, message, state);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotifyMembersImplCopyWith<_$NotifyMembersImpl> get copyWith =>
      __$$NotifyMembersImplCopyWithImpl<_$NotifyMembersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return initialNotification(transaction, user, message, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return initialNotification?.call(transaction, user, message, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (initialNotification != null) {
      return initialNotification(transaction, user, message, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return initialNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return initialNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (initialNotification != null) {
      return initialNotification(this);
    }
    return orElse();
  }
}

abstract class NotifyMembers implements TransactionEvent {
  const factory NotifyMembers(
      final Transaction transaction,
      final User user,
      final String message,
      final TransactionBlocState state) = _$NotifyMembersImpl;

  Transaction get transaction;
  User get user;
  String get message;
  TransactionBlocState get state;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotifyMembersImplCopyWith<_$NotifyMembersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateNotificationImplCopyWith<$Res> {
  factory _$$UpdateNotificationImplCopyWith(_$UpdateNotificationImpl value,
          $Res Function(_$UpdateNotificationImpl) then) =
      __$$UpdateNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User? user,
      int? notificationId,
      NotificationState notificationState,
      TransactionBlocState state});

  $UserCopyWith<$Res>? get user;
  $TransactionBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$UpdateNotificationImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$UpdateNotificationImpl>
    implements _$$UpdateNotificationImplCopyWith<$Res> {
  __$$UpdateNotificationImplCopyWithImpl(_$UpdateNotificationImpl _value,
      $Res Function(_$UpdateNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? notificationId = freezed,
    Object? notificationState = null,
    Object? state = null,
  }) {
    return _then(_$UpdateNotificationImpl(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      freezed == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      null == notificationState
          ? _value.notificationState
          : notificationState // ignore: cast_nullable_to_non_nullable
              as NotificationState,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get state {
    return $TransactionBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$UpdateNotificationImpl implements UpdateNotification {
  const _$UpdateNotificationImpl(
      this.user, this.notificationId, this.notificationState, this.state);

  @override
  final User? user;
  @override
  final int? notificationId;
  @override
  final NotificationState notificationState;
  @override
  final TransactionBlocState state;

  @override
  String toString() {
    return 'TransactionEvent.updateNotification(user: $user, notificationId: $notificationId, notificationState: $notificationState, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNotificationImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.notificationState, notificationState) ||
                other.notificationState == notificationState) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, notificationId, notificationState, state);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNotificationImplCopyWith<_$UpdateNotificationImpl> get copyWith =>
      __$$UpdateNotificationImplCopyWithImpl<_$UpdateNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return updateNotification(user, notificationId, notificationState, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return updateNotification?.call(
        user, notificationId, notificationState, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (updateNotification != null) {
      return updateNotification(user, notificationId, notificationState, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return updateNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return updateNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (updateNotification != null) {
      return updateNotification(this);
    }
    return orElse();
  }
}

abstract class UpdateNotification implements TransactionEvent {
  const factory UpdateNotification(
      final User? user,
      final int? notificationId,
      final NotificationState notificationState,
      final TransactionBlocState state) = _$UpdateNotificationImpl;

  User? get user;
  int? get notificationId;
  NotificationState get notificationState;
  TransactionBlocState get state;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateNotificationImplCopyWith<_$UpdateNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateLiveTransactionImplCopyWith<$Res> {
  factory _$$UpdateLiveTransactionImplCopyWith(
          _$UpdateLiveTransactionImpl value,
          $Res Function(_$UpdateLiveTransactionImpl) then) =
      __$$UpdateLiveTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Transaction> transactions, TransactionBlocState state});

  $TransactionBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$UpdateLiveTransactionImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$UpdateLiveTransactionImpl>
    implements _$$UpdateLiveTransactionImplCopyWith<$Res> {
  __$$UpdateLiveTransactionImplCopyWithImpl(_$UpdateLiveTransactionImpl _value,
      $Res Function(_$UpdateLiveTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? state = null,
  }) {
    return _then(_$UpdateLiveTransactionImpl(
      null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get state {
    return $TransactionBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$UpdateLiveTransactionImpl implements UpdateLiveTransaction {
  const _$UpdateLiveTransactionImpl(
      final List<Transaction> transactions, this.state)
      : _transactions = transactions;

  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final TransactionBlocState state;

  @override
  String toString() {
    return 'TransactionEvent.updateLiveTransactions(transactions: $transactions, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLiveTransactionImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions), state);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateLiveTransactionImplCopyWith<_$UpdateLiveTransactionImpl>
      get copyWith => __$$UpdateLiveTransactionImplCopyWithImpl<
          _$UpdateLiveTransactionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return updateLiveTransactions(transactions, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return updateLiveTransactions?.call(transactions, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (updateLiveTransactions != null) {
      return updateLiveTransactions(transactions, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return updateLiveTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return updateLiveTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (updateLiveTransactions != null) {
      return updateLiveTransactions(this);
    }
    return orElse();
  }
}

abstract class UpdateLiveTransaction implements TransactionEvent {
  const factory UpdateLiveTransaction(final List<Transaction> transactions,
      final TransactionBlocState state) = _$UpdateLiveTransactionImpl;

  List<Transaction> get transactions;
  TransactionBlocState get state;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateLiveTransactionImplCopyWith<_$UpdateLiveTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTransactionBlocStateImplCopyWith<$Res> {
  factory _$$UpdateTransactionBlocStateImplCopyWith(
          _$UpdateTransactionBlocStateImpl value,
          $Res Function(_$UpdateTransactionBlocStateImpl) then) =
      __$$UpdateTransactionBlocStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionBlocState newState});

  $TransactionBlocStateCopyWith<$Res> get newState;
}

/// @nodoc
class __$$UpdateTransactionBlocStateImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res,
        _$UpdateTransactionBlocStateImpl>
    implements _$$UpdateTransactionBlocStateImplCopyWith<$Res> {
  __$$UpdateTransactionBlocStateImplCopyWithImpl(
      _$UpdateTransactionBlocStateImpl _value,
      $Res Function(_$UpdateTransactionBlocStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newState = null,
  }) {
    return _then(_$UpdateTransactionBlocStateImpl(
      null == newState
          ? _value.newState
          : newState // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get newState {
    return $TransactionBlocStateCopyWith<$Res>(_value.newState, (value) {
      return _then(_value.copyWith(newState: value));
    });
  }
}

/// @nodoc

class _$UpdateTransactionBlocStateImpl implements UpdateTransactionBlocState {
  const _$UpdateTransactionBlocStateImpl(this.newState);

  @override
  final TransactionBlocState newState;

  @override
  String toString() {
    return 'TransactionEvent.updateTransactionState(newState: $newState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTransactionBlocStateImpl &&
            (identical(other.newState, newState) ||
                other.newState == newState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newState);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTransactionBlocStateImplCopyWith<_$UpdateTransactionBlocStateImpl>
      get copyWith => __$$UpdateTransactionBlocStateImplCopyWithImpl<
          _$UpdateTransactionBlocStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return updateTransactionState(newState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return updateTransactionState?.call(newState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (updateTransactionState != null) {
      return updateTransactionState(newState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return updateTransactionState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return updateTransactionState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (updateTransactionState != null) {
      return updateTransactionState(this);
    }
    return orElse();
  }
}

abstract class UpdateTransactionBlocState implements TransactionEvent {
  const factory UpdateTransactionBlocState(
      final TransactionBlocState newState) = _$UpdateTransactionBlocStateImpl;

  TransactionBlocState get newState;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTransactionBlocStateImplCopyWith<_$UpdateTransactionBlocStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveObligationImplCopyWith<$Res> {
  factory _$$RemoveObligationImplCopyWith(_$RemoveObligationImpl value,
          $Res Function(_$RemoveObligationImpl) then) =
      __$$RemoveObligationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int obligationId, TransactionBlocState state});

  $TransactionBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$RemoveObligationImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$RemoveObligationImpl>
    implements _$$RemoveObligationImplCopyWith<$Res> {
  __$$RemoveObligationImplCopyWithImpl(_$RemoveObligationImpl _value,
      $Res Function(_$RemoveObligationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? obligationId = null,
    Object? state = null,
  }) {
    return _then(_$RemoveObligationImpl(
      null == obligationId
          ? _value.obligationId
          : obligationId // ignore: cast_nullable_to_non_nullable
              as int,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionBlocState,
    ));
  }

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionBlocStateCopyWith<$Res> get state {
    return $TransactionBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$RemoveObligationImpl implements RemoveObligation {
  const _$RemoveObligationImpl(this.obligationId, this.state);

  @override
  final int obligationId;
  @override
  final TransactionBlocState state;

  @override
  String toString() {
    return 'TransactionEvent.removeObligation(obligationId: $obligationId, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveObligationImpl &&
            (identical(other.obligationId, obligationId) ||
                other.obligationId == obligationId) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, obligationId, state);

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveObligationImplCopyWith<_$RemoveObligationImpl> get copyWith =>
      __$$RemoveObligationImplCopyWithImpl<_$RemoveObligationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id, TransactionBlocState state)
        getTransaction,
    required TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)
        searchTransaction,
    required TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)
        getUsersHistory,
    required TResult Function(Transaction transaction,
            TransactionBlocState state, File? mediationSource)
        createTransaction,
    required TResult Function(
            Transaction transaction, TransactionBlocState state)
        updateTransaction,
    required TResult Function(Transaction transaction, int obligationId,
            String token, TransactionBlocState state)
        setObligationsToken,
    required TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)
        setObligationStatus,
    required TResult Function(int obligationId, TransactionBlocState state)
        addObligation,
    required TResult Function(Transaction transaction, User user,
            String message, TransactionBlocState state)
        initialNotification,
    required TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)
        updateNotification,
    required TResult Function(
            List<Transaction> transactions, TransactionBlocState state)
        updateLiveTransactions,
    required TResult Function(TransactionBlocState newState)
        updateTransactionState,
    required TResult Function(int obligationId, TransactionBlocState state)
        removeObligation,
  }) {
    return removeObligation(obligationId, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id, TransactionBlocState state)? getTransaction,
    TResult? Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult? Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult? Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult? Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult? Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult? Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult? Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult? Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult? Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult? Function(TransactionBlocState newState)? updateTransactionState,
    TResult? Function(int obligationId, TransactionBlocState state)?
        removeObligation,
  }) {
    return removeObligation?.call(obligationId, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id, TransactionBlocState state)? getTransaction,
    TResult Function(
            String text, int pageSize, int page, TransactionBlocState state)?
        searchTransaction,
    TResult Function(
            int id, int pageSize, int page, TransactionBlocState state)?
        getUsersHistory,
    TResult Function(Transaction transaction, TransactionBlocState state,
            File? mediationSource)?
        createTransaction,
    TResult Function(Transaction transaction, TransactionBlocState state)?
        updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token,
            TransactionBlocState state)?
        setObligationsToken,
    TResult Function(Transaction transaction, int obligationId,
            ObligationStatus status, TransactionBlocState state)?
        setObligationStatus,
    TResult Function(int obligationId, TransactionBlocState state)?
        addObligation,
    TResult Function(Transaction transaction, User user, String message,
            TransactionBlocState state)?
        initialNotification,
    TResult Function(User? user, int? notificationId,
            NotificationState notificationState, TransactionBlocState state)?
        updateNotification,
    TResult Function(
            List<Transaction> transactions, TransactionBlocState state)?
        updateLiveTransactions,
    TResult Function(TransactionBlocState newState)? updateTransactionState,
    TResult Function(int obligationId, TransactionBlocState state)?
        removeObligation,
    required TResult orElse(),
  }) {
    if (removeObligation != null) {
      return removeObligation(obligationId, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(SearchTransaction value) searchTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(UpdateNotification value) updateNotification,
    required TResult Function(UpdateLiveTransaction value)
        updateLiveTransactions,
    required TResult Function(UpdateTransactionBlocState value)
        updateTransactionState,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return removeObligation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(SearchTransaction value)? searchTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(UpdateNotification value)? updateNotification,
    TResult? Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult? Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return removeObligation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(SearchTransaction value)? searchTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
    TResult Function(UpdateNotification value)? updateNotification,
    TResult Function(UpdateLiveTransaction value)? updateLiveTransactions,
    TResult Function(UpdateTransactionBlocState value)? updateTransactionState,
    TResult Function(RemoveObligation value)? removeObligation,
    required TResult orElse(),
  }) {
    if (removeObligation != null) {
      return removeObligation(this);
    }
    return orElse();
  }
}

abstract class RemoveObligation implements TransactionEvent {
  const factory RemoveObligation(
          final int obligationId, final TransactionBlocState state) =
      _$RemoveObligationImpl;

  int get obligationId;
  TransactionBlocState get state;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveObligationImplCopyWith<_$RemoveObligationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionBlocState {
  TransactionBlocStatus get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Transaction? get transaction => throw _privateConstructorUsedError;
  List<Transaction>? get transactionSearchResult =>
      throw _privateConstructorUsedError;
  List<Transaction>? get transactionHistory =>
      throw _privateConstructorUsedError;
  List<Transaction>? get liveTransactions => throw _privateConstructorUsedError;

  /// Create a copy of TransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionBlocStateCopyWith<TransactionBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionBlocStateCopyWith<$Res> {
  factory $TransactionBlocStateCopyWith(TransactionBlocState value,
          $Res Function(TransactionBlocState) then) =
      _$TransactionBlocStateCopyWithImpl<$Res, TransactionBlocState>;
  @useResult
  $Res call(
      {TransactionBlocStatus status,
      String? message,
      Transaction? transaction,
      List<Transaction>? transactionSearchResult,
      List<Transaction>? transactionHistory,
      List<Transaction>? liveTransactions});

  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$TransactionBlocStateCopyWithImpl<$Res,
        $Val extends TransactionBlocState>
    implements $TransactionBlocStateCopyWith<$Res> {
  _$TransactionBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? transaction = freezed,
    Object? transactionSearchResult = freezed,
    Object? transactionHistory = freezed,
    Object? liveTransactions = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionBlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      transactionSearchResult: freezed == transactionSearchResult
          ? _value.transactionSearchResult
          : transactionSearchResult // ignore: cast_nullable_to_non_nullable
              as List<Transaction>?,
      transactionHistory: freezed == transactionHistory
          ? _value.transactionHistory
          : transactionHistory // ignore: cast_nullable_to_non_nullable
              as List<Transaction>?,
      liveTransactions: freezed == liveTransactions
          ? _value.liveTransactions
          : liveTransactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>?,
    ) as $Val);
  }

  /// Create a copy of TransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res>? get transaction {
    if (_value.transaction == null) {
      return null;
    }

    return $TransactionCopyWith<$Res>(_value.transaction!, (value) {
      return _then(_value.copyWith(transaction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TransactionBlocStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransactionBlocStatus status,
      String? message,
      Transaction? transaction,
      List<Transaction>? transactionSearchResult,
      List<Transaction>? transactionHistory,
      List<Transaction>? liveTransactions});

  @override
  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TransactionBlocStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? transaction = freezed,
    Object? transactionSearchResult = freezed,
    Object? transactionHistory = freezed,
    Object? liveTransactions = freezed,
  }) {
    return _then(_$InitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionBlocStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      transactionSearchResult: freezed == transactionSearchResult
          ? _value._transactionSearchResult
          : transactionSearchResult // ignore: cast_nullable_to_non_nullable
              as List<Transaction>?,
      transactionHistory: freezed == transactionHistory
          ? _value._transactionHistory
          : transactionHistory // ignore: cast_nullable_to_non_nullable
              as List<Transaction>?,
      liveTransactions: freezed == liveTransactions
          ? _value._liveTransactions
          : liveTransactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.status = TransactionBlocStatus.initial,
      this.message = null,
      this.transaction = null,
      final List<Transaction>? transactionSearchResult = null,
      final List<Transaction>? transactionHistory = null,
      final List<Transaction>? liveTransactions = null})
      : _transactionSearchResult = transactionSearchResult,
        _transactionHistory = transactionHistory,
        _liveTransactions = liveTransactions;

  @override
  @JsonKey()
  final TransactionBlocStatus status;
  @override
  @JsonKey()
  final String? message;
  @override
  @JsonKey()
  final Transaction? transaction;
  final List<Transaction>? _transactionSearchResult;
  @override
  @JsonKey()
  List<Transaction>? get transactionSearchResult {
    final value = _transactionSearchResult;
    if (value == null) return null;
    if (_transactionSearchResult is EqualUnmodifiableListView)
      return _transactionSearchResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Transaction>? _transactionHistory;
  @override
  @JsonKey()
  List<Transaction>? get transactionHistory {
    final value = _transactionHistory;
    if (value == null) return null;
    if (_transactionHistory is EqualUnmodifiableListView)
      return _transactionHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Transaction>? _liveTransactions;
  @override
  @JsonKey()
  List<Transaction>? get liveTransactions {
    final value = _liveTransactions;
    if (value == null) return null;
    if (_liveTransactions is EqualUnmodifiableListView)
      return _liveTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TransactionBlocState(status: $status, message: $message, transaction: $transaction, transactionSearchResult: $transactionSearchResult, transactionHistory: $transactionHistory, liveTransactions: $liveTransactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            const DeepCollectionEquality().equals(
                other._transactionSearchResult, _transactionSearchResult) &&
            const DeepCollectionEquality()
                .equals(other._transactionHistory, _transactionHistory) &&
            const DeepCollectionEquality()
                .equals(other._liveTransactions, _liveTransactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      message,
      transaction,
      const DeepCollectionEquality().hash(_transactionSearchResult),
      const DeepCollectionEquality().hash(_transactionHistory),
      const DeepCollectionEquality().hash(_liveTransactions));

  /// Create a copy of TransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements TransactionBlocState {
  const factory _Initial(
      {final TransactionBlocStatus status,
      final String? message,
      final Transaction? transaction,
      final List<Transaction>? transactionSearchResult,
      final List<Transaction>? transactionHistory,
      final List<Transaction>? liveTransactions}) = _$InitialImpl;

  @override
  TransactionBlocStatus get status;
  @override
  String? get message;
  @override
  Transaction? get transaction;
  @override
  List<Transaction>? get transactionSearchResult;
  @override
  List<Transaction>? get transactionHistory;
  @override
  List<Transaction>? get liveTransactions;

  /// Create a copy of TransactionBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
