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
    required TResult Function(int id) getTransaction,
    required TResult Function(int id, int pageSize, int page) getUsersHistory,
    required TResult Function(Transaction transaction) createTransaction,
    required TResult Function(Transaction transaction) updateTransaction,
    required TResult Function(
            Transaction transaction, int obligationId, String token)
        setObligationsToken,
    required TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)
        setObligationStatus,
    required TResult Function(int obligationId) addObligation,
    required TResult Function(
            Transaction transaction, User user, String message)
        initialNotification,
    required TResult Function(int obligationId) removeObligation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getTransaction,
    TResult? Function(int id, int pageSize, int page)? getUsersHistory,
    TResult? Function(Transaction transaction)? createTransaction,
    TResult? Function(Transaction transaction)? updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult? Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult? Function(int obligationId)? addObligation,
    TResult? Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult? Function(int obligationId)? removeObligation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getTransaction,
    TResult Function(int id, int pageSize, int page)? getUsersHistory,
    TResult Function(Transaction transaction)? createTransaction,
    TResult Function(Transaction transaction)? updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult Function(int obligationId)? addObligation,
    TResult Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult Function(int obligationId)? removeObligation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(RemoveObligation value) removeObligation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
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
  $Res call({int id});
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
  }) {
    return _then(_$GetTransactionImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetTransactionImpl implements GetTransaction {
  const _$GetTransactionImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TransactionEvent.getTransaction(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTransactionImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

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
    required TResult Function(int id) getTransaction,
    required TResult Function(int id, int pageSize, int page) getUsersHistory,
    required TResult Function(Transaction transaction) createTransaction,
    required TResult Function(Transaction transaction) updateTransaction,
    required TResult Function(
            Transaction transaction, int obligationId, String token)
        setObligationsToken,
    required TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)
        setObligationStatus,
    required TResult Function(int obligationId) addObligation,
    required TResult Function(
            Transaction transaction, User user, String message)
        initialNotification,
    required TResult Function(int obligationId) removeObligation,
  }) {
    return getTransaction(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getTransaction,
    TResult? Function(int id, int pageSize, int page)? getUsersHistory,
    TResult? Function(Transaction transaction)? createTransaction,
    TResult? Function(Transaction transaction)? updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult? Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult? Function(int obligationId)? addObligation,
    TResult? Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult? Function(int obligationId)? removeObligation,
  }) {
    return getTransaction?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getTransaction,
    TResult Function(int id, int pageSize, int page)? getUsersHistory,
    TResult Function(Transaction transaction)? createTransaction,
    TResult Function(Transaction transaction)? updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult Function(int obligationId)? addObligation,
    TResult Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult Function(int obligationId)? removeObligation,
    required TResult orElse(),
  }) {
    if (getTransaction != null) {
      return getTransaction(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return getTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return getTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
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
  const factory GetTransaction(final int id) = _$GetTransactionImpl;

  int get id;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTransactionImplCopyWith<_$GetTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadUserHistoryImplCopyWith<$Res> {
  factory _$$LoadUserHistoryImplCopyWith(_$LoadUserHistoryImpl value,
          $Res Function(_$LoadUserHistoryImpl) then) =
      __$$LoadUserHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, int pageSize, int page});
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
    ));
  }
}

/// @nodoc

class _$LoadUserHistoryImpl implements LoadUserHistory {
  const _$LoadUserHistoryImpl(this.id, this.pageSize, this.page);

  @override
  final int id;
  @override
  final int pageSize;
  @override
  final int page;

  @override
  String toString() {
    return 'TransactionEvent.getUsersHistory(id: $id, pageSize: $pageSize, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUserHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, pageSize, page);

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
    required TResult Function(int id) getTransaction,
    required TResult Function(int id, int pageSize, int page) getUsersHistory,
    required TResult Function(Transaction transaction) createTransaction,
    required TResult Function(Transaction transaction) updateTransaction,
    required TResult Function(
            Transaction transaction, int obligationId, String token)
        setObligationsToken,
    required TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)
        setObligationStatus,
    required TResult Function(int obligationId) addObligation,
    required TResult Function(
            Transaction transaction, User user, String message)
        initialNotification,
    required TResult Function(int obligationId) removeObligation,
  }) {
    return getUsersHistory(id, pageSize, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getTransaction,
    TResult? Function(int id, int pageSize, int page)? getUsersHistory,
    TResult? Function(Transaction transaction)? createTransaction,
    TResult? Function(Transaction transaction)? updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult? Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult? Function(int obligationId)? addObligation,
    TResult? Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult? Function(int obligationId)? removeObligation,
  }) {
    return getUsersHistory?.call(id, pageSize, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getTransaction,
    TResult Function(int id, int pageSize, int page)? getUsersHistory,
    TResult Function(Transaction transaction)? createTransaction,
    TResult Function(Transaction transaction)? updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult Function(int obligationId)? addObligation,
    TResult Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult Function(int obligationId)? removeObligation,
    required TResult orElse(),
  }) {
    if (getUsersHistory != null) {
      return getUsersHistory(id, pageSize, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return getUsersHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return getUsersHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
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
  const factory LoadUserHistory(
      final int id, final int pageSize, final int page) = _$LoadUserHistoryImpl;

  int get id;
  int get pageSize;
  int get page;

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
  $Res call({Transaction transaction});

  $TransactionCopyWith<$Res> get transaction;
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
  }) {
    return _then(_$CreateTransactionImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
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
}

/// @nodoc

class _$CreateTransactionImpl implements CreateTransaction {
  const _$CreateTransactionImpl(this.transaction);

  @override
  final Transaction transaction;

  @override
  String toString() {
    return 'TransactionEvent.createTransaction(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTransactionImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

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
    required TResult Function(int id) getTransaction,
    required TResult Function(int id, int pageSize, int page) getUsersHistory,
    required TResult Function(Transaction transaction) createTransaction,
    required TResult Function(Transaction transaction) updateTransaction,
    required TResult Function(
            Transaction transaction, int obligationId, String token)
        setObligationsToken,
    required TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)
        setObligationStatus,
    required TResult Function(int obligationId) addObligation,
    required TResult Function(
            Transaction transaction, User user, String message)
        initialNotification,
    required TResult Function(int obligationId) removeObligation,
  }) {
    return createTransaction(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getTransaction,
    TResult? Function(int id, int pageSize, int page)? getUsersHistory,
    TResult? Function(Transaction transaction)? createTransaction,
    TResult? Function(Transaction transaction)? updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult? Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult? Function(int obligationId)? addObligation,
    TResult? Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult? Function(int obligationId)? removeObligation,
  }) {
    return createTransaction?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getTransaction,
    TResult Function(int id, int pageSize, int page)? getUsersHistory,
    TResult Function(Transaction transaction)? createTransaction,
    TResult Function(Transaction transaction)? updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult Function(int obligationId)? addObligation,
    TResult Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult Function(int obligationId)? removeObligation,
    required TResult orElse(),
  }) {
    if (createTransaction != null) {
      return createTransaction(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return createTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return createTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
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
  const factory CreateTransaction(final Transaction transaction) =
      _$CreateTransactionImpl;

  Transaction get transaction;

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
  $Res call({Transaction transaction});

  $TransactionCopyWith<$Res> get transaction;
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
  }) {
    return _then(_$UpdateTransactionImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
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
}

/// @nodoc

class _$UpdateTransactionImpl implements UpdateTransaction {
  const _$UpdateTransactionImpl(this.transaction);

  @override
  final Transaction transaction;

  @override
  String toString() {
    return 'TransactionEvent.updateTransaction(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTransactionImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

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
    required TResult Function(int id) getTransaction,
    required TResult Function(int id, int pageSize, int page) getUsersHistory,
    required TResult Function(Transaction transaction) createTransaction,
    required TResult Function(Transaction transaction) updateTransaction,
    required TResult Function(
            Transaction transaction, int obligationId, String token)
        setObligationsToken,
    required TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)
        setObligationStatus,
    required TResult Function(int obligationId) addObligation,
    required TResult Function(
            Transaction transaction, User user, String message)
        initialNotification,
    required TResult Function(int obligationId) removeObligation,
  }) {
    return updateTransaction(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getTransaction,
    TResult? Function(int id, int pageSize, int page)? getUsersHistory,
    TResult? Function(Transaction transaction)? createTransaction,
    TResult? Function(Transaction transaction)? updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult? Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult? Function(int obligationId)? addObligation,
    TResult? Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult? Function(int obligationId)? removeObligation,
  }) {
    return updateTransaction?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getTransaction,
    TResult Function(int id, int pageSize, int page)? getUsersHistory,
    TResult Function(Transaction transaction)? createTransaction,
    TResult Function(Transaction transaction)? updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult Function(int obligationId)? addObligation,
    TResult Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult Function(int obligationId)? removeObligation,
    required TResult orElse(),
  }) {
    if (updateTransaction != null) {
      return updateTransaction(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return updateTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return updateTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
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
  const factory UpdateTransaction(final Transaction transaction) =
      _$UpdateTransactionImpl;

  Transaction get transaction;

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
  $Res call({Transaction transaction, int obligationId, String token});

  $TransactionCopyWith<$Res> get transaction;
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
}

/// @nodoc

class _$SetObligationsTokenImpl implements SetObligationsToken {
  const _$SetObligationsTokenImpl(
      this.transaction, this.obligationId, this.token);

  @override
  final Transaction transaction;
  @override
  final int obligationId;
  @override
  final String token;

  @override
  String toString() {
    return 'TransactionEvent.setObligationsToken(transaction: $transaction, obligationId: $obligationId, token: $token)';
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
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, transaction, obligationId, token);

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
    required TResult Function(int id) getTransaction,
    required TResult Function(int id, int pageSize, int page) getUsersHistory,
    required TResult Function(Transaction transaction) createTransaction,
    required TResult Function(Transaction transaction) updateTransaction,
    required TResult Function(
            Transaction transaction, int obligationId, String token)
        setObligationsToken,
    required TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)
        setObligationStatus,
    required TResult Function(int obligationId) addObligation,
    required TResult Function(
            Transaction transaction, User user, String message)
        initialNotification,
    required TResult Function(int obligationId) removeObligation,
  }) {
    return setObligationsToken(transaction, obligationId, token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getTransaction,
    TResult? Function(int id, int pageSize, int page)? getUsersHistory,
    TResult? Function(Transaction transaction)? createTransaction,
    TResult? Function(Transaction transaction)? updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult? Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult? Function(int obligationId)? addObligation,
    TResult? Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult? Function(int obligationId)? removeObligation,
  }) {
    return setObligationsToken?.call(transaction, obligationId, token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getTransaction,
    TResult Function(int id, int pageSize, int page)? getUsersHistory,
    TResult Function(Transaction transaction)? createTransaction,
    TResult Function(Transaction transaction)? updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult Function(int obligationId)? addObligation,
    TResult Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult Function(int obligationId)? removeObligation,
    required TResult orElse(),
  }) {
    if (setObligationsToken != null) {
      return setObligationsToken(transaction, obligationId, token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return setObligationsToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return setObligationsToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
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
  const factory SetObligationsToken(final Transaction transaction,
      final int obligationId, final String token) = _$SetObligationsTokenImpl;

  Transaction get transaction;
  int get obligationId;
  String get token;

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
      {Transaction transaction, int obligationId, ObligationStatus status});

  $TransactionCopyWith<$Res> get transaction;
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
}

/// @nodoc

class _$SetObligationStatusImpl implements SetObligationStatus {
  const _$SetObligationStatusImpl(
      this.transaction, this.obligationId, this.status);

  @override
  final Transaction transaction;
  @override
  final int obligationId;
  @override
  final ObligationStatus status;

  @override
  String toString() {
    return 'TransactionEvent.setObligationStatus(transaction: $transaction, obligationId: $obligationId, status: $status)';
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
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, transaction, obligationId, status);

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
    required TResult Function(int id) getTransaction,
    required TResult Function(int id, int pageSize, int page) getUsersHistory,
    required TResult Function(Transaction transaction) createTransaction,
    required TResult Function(Transaction transaction) updateTransaction,
    required TResult Function(
            Transaction transaction, int obligationId, String token)
        setObligationsToken,
    required TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)
        setObligationStatus,
    required TResult Function(int obligationId) addObligation,
    required TResult Function(
            Transaction transaction, User user, String message)
        initialNotification,
    required TResult Function(int obligationId) removeObligation,
  }) {
    return setObligationStatus(transaction, obligationId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getTransaction,
    TResult? Function(int id, int pageSize, int page)? getUsersHistory,
    TResult? Function(Transaction transaction)? createTransaction,
    TResult? Function(Transaction transaction)? updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult? Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult? Function(int obligationId)? addObligation,
    TResult? Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult? Function(int obligationId)? removeObligation,
  }) {
    return setObligationStatus?.call(transaction, obligationId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getTransaction,
    TResult Function(int id, int pageSize, int page)? getUsersHistory,
    TResult Function(Transaction transaction)? createTransaction,
    TResult Function(Transaction transaction)? updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult Function(int obligationId)? addObligation,
    TResult Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult Function(int obligationId)? removeObligation,
    required TResult orElse(),
  }) {
    if (setObligationStatus != null) {
      return setObligationStatus(transaction, obligationId, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return setObligationStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return setObligationStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
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
      final ObligationStatus status) = _$SetObligationStatusImpl;

  Transaction get transaction;
  int get obligationId;
  ObligationStatus get status;

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
  $Res call({int obligationId});
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
  }) {
    return _then(_$AddObligationImpl(
      null == obligationId
          ? _value.obligationId
          : obligationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddObligationImpl implements AddObligation {
  const _$AddObligationImpl(this.obligationId);

  @override
  final int obligationId;

  @override
  String toString() {
    return 'TransactionEvent.addObligation(obligationId: $obligationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddObligationImpl &&
            (identical(other.obligationId, obligationId) ||
                other.obligationId == obligationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, obligationId);

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
    required TResult Function(int id) getTransaction,
    required TResult Function(int id, int pageSize, int page) getUsersHistory,
    required TResult Function(Transaction transaction) createTransaction,
    required TResult Function(Transaction transaction) updateTransaction,
    required TResult Function(
            Transaction transaction, int obligationId, String token)
        setObligationsToken,
    required TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)
        setObligationStatus,
    required TResult Function(int obligationId) addObligation,
    required TResult Function(
            Transaction transaction, User user, String message)
        initialNotification,
    required TResult Function(int obligationId) removeObligation,
  }) {
    return addObligation(obligationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getTransaction,
    TResult? Function(int id, int pageSize, int page)? getUsersHistory,
    TResult? Function(Transaction transaction)? createTransaction,
    TResult? Function(Transaction transaction)? updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult? Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult? Function(int obligationId)? addObligation,
    TResult? Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult? Function(int obligationId)? removeObligation,
  }) {
    return addObligation?.call(obligationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getTransaction,
    TResult Function(int id, int pageSize, int page)? getUsersHistory,
    TResult Function(Transaction transaction)? createTransaction,
    TResult Function(Transaction transaction)? updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult Function(int obligationId)? addObligation,
    TResult Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult Function(int obligationId)? removeObligation,
    required TResult orElse(),
  }) {
    if (addObligation != null) {
      return addObligation(obligationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return addObligation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return addObligation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
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
  const factory AddObligation(final int obligationId) = _$AddObligationImpl;

  int get obligationId;

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
  $Res call({Transaction transaction, User user, String message});

  $TransactionCopyWith<$Res> get transaction;
  $UserCopyWith<$Res> get user;
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
}

/// @nodoc

class _$NotifyMembersImpl implements NotifyMembers {
  const _$NotifyMembersImpl(this.transaction, this.user, this.message);

  @override
  final Transaction transaction;
  @override
  final User user;
  @override
  final String message;

  @override
  String toString() {
    return 'TransactionEvent.initialNotification(transaction: $transaction, user: $user, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotifyMembersImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction, user, message);

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
    required TResult Function(int id) getTransaction,
    required TResult Function(int id, int pageSize, int page) getUsersHistory,
    required TResult Function(Transaction transaction) createTransaction,
    required TResult Function(Transaction transaction) updateTransaction,
    required TResult Function(
            Transaction transaction, int obligationId, String token)
        setObligationsToken,
    required TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)
        setObligationStatus,
    required TResult Function(int obligationId) addObligation,
    required TResult Function(
            Transaction transaction, User user, String message)
        initialNotification,
    required TResult Function(int obligationId) removeObligation,
  }) {
    return initialNotification(transaction, user, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getTransaction,
    TResult? Function(int id, int pageSize, int page)? getUsersHistory,
    TResult? Function(Transaction transaction)? createTransaction,
    TResult? Function(Transaction transaction)? updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult? Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult? Function(int obligationId)? addObligation,
    TResult? Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult? Function(int obligationId)? removeObligation,
  }) {
    return initialNotification?.call(transaction, user, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getTransaction,
    TResult Function(int id, int pageSize, int page)? getUsersHistory,
    TResult Function(Transaction transaction)? createTransaction,
    TResult Function(Transaction transaction)? updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult Function(int obligationId)? addObligation,
    TResult Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult Function(int obligationId)? removeObligation,
    required TResult orElse(),
  }) {
    if (initialNotification != null) {
      return initialNotification(transaction, user, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return initialNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return initialNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
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
  const factory NotifyMembers(final Transaction transaction, final User user,
      final String message) = _$NotifyMembersImpl;

  Transaction get transaction;
  User get user;
  String get message;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotifyMembersImplCopyWith<_$NotifyMembersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveObligationImplCopyWith<$Res> {
  factory _$$RemoveObligationImplCopyWith(_$RemoveObligationImpl value,
          $Res Function(_$RemoveObligationImpl) then) =
      __$$RemoveObligationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int obligationId});
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
  }) {
    return _then(_$RemoveObligationImpl(
      null == obligationId
          ? _value.obligationId
          : obligationId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveObligationImpl implements RemoveObligation {
  const _$RemoveObligationImpl(this.obligationId);

  @override
  final int obligationId;

  @override
  String toString() {
    return 'TransactionEvent.removeObligation(obligationId: $obligationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveObligationImpl &&
            (identical(other.obligationId, obligationId) ||
                other.obligationId == obligationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, obligationId);

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
    required TResult Function(int id) getTransaction,
    required TResult Function(int id, int pageSize, int page) getUsersHistory,
    required TResult Function(Transaction transaction) createTransaction,
    required TResult Function(Transaction transaction) updateTransaction,
    required TResult Function(
            Transaction transaction, int obligationId, String token)
        setObligationsToken,
    required TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)
        setObligationStatus,
    required TResult Function(int obligationId) addObligation,
    required TResult Function(
            Transaction transaction, User user, String message)
        initialNotification,
    required TResult Function(int obligationId) removeObligation,
  }) {
    return removeObligation(obligationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getTransaction,
    TResult? Function(int id, int pageSize, int page)? getUsersHistory,
    TResult? Function(Transaction transaction)? createTransaction,
    TResult? Function(Transaction transaction)? updateTransaction,
    TResult? Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult? Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult? Function(int obligationId)? addObligation,
    TResult? Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult? Function(int obligationId)? removeObligation,
  }) {
    return removeObligation?.call(obligationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getTransaction,
    TResult Function(int id, int pageSize, int page)? getUsersHistory,
    TResult Function(Transaction transaction)? createTransaction,
    TResult Function(Transaction transaction)? updateTransaction,
    TResult Function(Transaction transaction, int obligationId, String token)?
        setObligationsToken,
    TResult Function(
            Transaction transaction, int obligationId, ObligationStatus status)?
        setObligationStatus,
    TResult Function(int obligationId)? addObligation,
    TResult Function(Transaction transaction, User user, String message)?
        initialNotification,
    TResult Function(int obligationId)? removeObligation,
    required TResult orElse(),
  }) {
    if (removeObligation != null) {
      return removeObligation(obligationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetTransaction value) getTransaction,
    required TResult Function(LoadUserHistory value) getUsersHistory,
    required TResult Function(CreateTransaction value) createTransaction,
    required TResult Function(UpdateTransaction value) updateTransaction,
    required TResult Function(SetObligationsToken value) setObligationsToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(AddObligation value) addObligation,
    required TResult Function(NotifyMembers value) initialNotification,
    required TResult Function(RemoveObligation value) removeObligation,
  }) {
    return removeObligation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetTransaction value)? getTransaction,
    TResult? Function(LoadUserHistory value)? getUsersHistory,
    TResult? Function(CreateTransaction value)? createTransaction,
    TResult? Function(UpdateTransaction value)? updateTransaction,
    TResult? Function(SetObligationsToken value)? setObligationsToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(AddObligation value)? addObligation,
    TResult? Function(NotifyMembers value)? initialNotification,
    TResult? Function(RemoveObligation value)? removeObligation,
  }) {
    return removeObligation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetTransaction value)? getTransaction,
    TResult Function(LoadUserHistory value)? getUsersHistory,
    TResult Function(CreateTransaction value)? createTransaction,
    TResult Function(UpdateTransaction value)? updateTransaction,
    TResult Function(SetObligationsToken value)? setObligationsToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(AddObligation value)? addObligation,
    TResult Function(NotifyMembers value)? initialNotification,
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
  const factory RemoveObligation(final int obligationId) =
      _$RemoveObligationImpl;

  int get obligationId;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveObligationImplCopyWith<_$RemoveObligationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionState {
  TransactionBlocStatus get status => throw _privateConstructorUsedError;
  Transaction? get transaction => throw _privateConstructorUsedError;
  List<Transaction>? get transactionHistory =>
      throw _privateConstructorUsedError;
  List<Transaction>? get liveTransactions => throw _privateConstructorUsedError;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionStateCopyWith<TransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStateCopyWith<$Res> {
  factory $TransactionStateCopyWith(
          TransactionState value, $Res Function(TransactionState) then) =
      _$TransactionStateCopyWithImpl<$Res, TransactionState>;
  @useResult
  $Res call(
      {TransactionBlocStatus status,
      Transaction? transaction,
      List<Transaction>? transactionHistory,
      List<Transaction>? liveTransactions});

  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$TransactionStateCopyWithImpl<$Res, $Val extends TransactionState>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? transaction = freezed,
    Object? transactionHistory = freezed,
    Object? liveTransactions = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionBlocStatus,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
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

  /// Create a copy of TransactionState
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
    implements $TransactionStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransactionBlocStatus status,
      Transaction? transaction,
      List<Transaction>? transactionHistory,
      List<Transaction>? liveTransactions});

  @override
  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? transaction = freezed,
    Object? transactionHistory = freezed,
    Object? liveTransactions = freezed,
  }) {
    return _then(_$InitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionBlocStatus,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
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
      this.transaction = null,
      final List<Transaction>? transactionHistory = null,
      final List<Transaction>? liveTransactions = null})
      : _transactionHistory = transactionHistory,
        _liveTransactions = liveTransactions;

  @override
  @JsonKey()
  final TransactionBlocStatus status;
  @override
  @JsonKey()
  final Transaction? transaction;
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
    return 'TransactionState(status: $status, transaction: $transaction, transactionHistory: $transactionHistory, liveTransactions: $liveTransactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            const DeepCollectionEquality()
                .equals(other._transactionHistory, _transactionHistory) &&
            const DeepCollectionEquality()
                .equals(other._liveTransactions, _liveTransactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      transaction,
      const DeepCollectionEquality().hash(_transactionHistory),
      const DeepCollectionEquality().hash(_liveTransactions));

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements TransactionState {
  const factory _Initial(
      {final TransactionBlocStatus status,
      final Transaction? transaction,
      final List<Transaction>? transactionHistory,
      final List<Transaction>? liveTransactions}) = _$InitialImpl;

  @override
  TransactionBlocStatus get status;
  @override
  Transaction? get transaction;
  @override
  List<Transaction>? get transactionHistory;
  @override
  List<Transaction>? get liveTransactions;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
