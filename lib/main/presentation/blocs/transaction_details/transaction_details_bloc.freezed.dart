// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailsEventCopyWith<$Res> {
  factory $TransactionDetailsEventCopyWith(TransactionDetailsEvent value,
          $Res Function(TransactionDetailsEvent) then) =
      _$TransactionDetailsEventCopyWithImpl<$Res, TransactionDetailsEvent>;
}

/// @nodoc
class _$TransactionDetailsEventCopyWithImpl<$Res,
        $Val extends TransactionDetailsEvent>
    implements $TransactionDetailsEventCopyWith<$Res> {
  _$TransactionDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Transaction transaction});

  $TransactionCopyWith<$Res> get transaction;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$InitImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
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

class _$InitImpl implements Init {
  const _$InitImpl(this.transaction);

  @override
  final Transaction transaction;

  @override
  String toString() {
    return 'TransactionDetailsEvent.init(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      __$$InitImplCopyWithImpl<_$InitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return init(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return init?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements TransactionDetailsEvent {
  const factory Init(final Transaction transaction) = _$InitImpl;

  Transaction get transaction;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleTokenVisibilityImplCopyWith<$Res> {
  factory _$$ToggleTokenVisibilityImplCopyWith(
          _$ToggleTokenVisibilityImpl value,
          $Res Function(_$ToggleTokenVisibilityImpl) then) =
      __$$ToggleTokenVisibilityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, TransactionDetailsState state});

  $TransactionDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$ToggleTokenVisibilityImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res,
        _$ToggleTokenVisibilityImpl>
    implements _$$ToggleTokenVisibilityImplCopyWith<$Res> {
  __$$ToggleTokenVisibilityImplCopyWithImpl(_$ToggleTokenVisibilityImpl _value,
      $Res Function(_$ToggleTokenVisibilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? state = null,
  }) {
    return _then(_$ToggleTokenVisibilityImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$ToggleTokenVisibilityImpl implements ToggleTokenVisibility {
  const _$ToggleTokenVisibilityImpl(this.index, this.state);

  @override
  final int index;
  @override
  final TransactionDetailsState state;

  @override
  String toString() {
    return 'TransactionDetailsEvent.toggleTokenVisibility(index: $index, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleTokenVisibilityImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, state);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleTokenVisibilityImplCopyWith<_$ToggleTokenVisibilityImpl>
      get copyWith => __$$ToggleTokenVisibilityImplCopyWithImpl<
          _$ToggleTokenVisibilityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return toggleTokenVisibility(index, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return toggleTokenVisibility?.call(index, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (toggleTokenVisibility != null) {
      return toggleTokenVisibility(index, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return toggleTokenVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return toggleTokenVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (toggleTokenVisibility != null) {
      return toggleTokenVisibility(this);
    }
    return orElse();
  }
}

abstract class ToggleTokenVisibility implements TransactionDetailsEvent {
  const factory ToggleTokenVisibility(
          final int index, final TransactionDetailsState state) =
      _$ToggleTokenVisibilityImpl;

  int get index;
  TransactionDetailsState get state;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleTokenVisibilityImplCopyWith<_$ToggleTokenVisibilityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleFulfilmentVisibilityImplCopyWith<$Res> {
  factory _$$ToggleFulfilmentVisibilityImplCopyWith(
          _$ToggleFulfilmentVisibilityImpl value,
          $Res Function(_$ToggleFulfilmentVisibilityImpl) then) =
      __$$ToggleFulfilmentVisibilityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, TransactionDetailsState state});

  $TransactionDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$ToggleFulfilmentVisibilityImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res,
        _$ToggleFulfilmentVisibilityImpl>
    implements _$$ToggleFulfilmentVisibilityImplCopyWith<$Res> {
  __$$ToggleFulfilmentVisibilityImplCopyWithImpl(
      _$ToggleFulfilmentVisibilityImpl _value,
      $Res Function(_$ToggleFulfilmentVisibilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? state = null,
  }) {
    return _then(_$ToggleFulfilmentVisibilityImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$ToggleFulfilmentVisibilityImpl implements ToggleFulfilmentVisibility {
  const _$ToggleFulfilmentVisibilityImpl(this.index, this.state);

  @override
  final int index;
  @override
  final TransactionDetailsState state;

  @override
  String toString() {
    return 'TransactionDetailsEvent.toggleFulfilmentVisibility(index: $index, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleFulfilmentVisibilityImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, state);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleFulfilmentVisibilityImplCopyWith<_$ToggleFulfilmentVisibilityImpl>
      get copyWith => __$$ToggleFulfilmentVisibilityImplCopyWithImpl<
          _$ToggleFulfilmentVisibilityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return toggleFulfilmentVisibility(index, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return toggleFulfilmentVisibility?.call(index, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (toggleFulfilmentVisibility != null) {
      return toggleFulfilmentVisibility(index, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return toggleFulfilmentVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return toggleFulfilmentVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (toggleFulfilmentVisibility != null) {
      return toggleFulfilmentVisibility(this);
    }
    return orElse();
  }
}

abstract class ToggleFulfilmentVisibility implements TransactionDetailsEvent {
  const factory ToggleFulfilmentVisibility(
          final int index, final TransactionDetailsState state) =
      _$ToggleFulfilmentVisibilityImpl;

  int get index;
  TransactionDetailsState get state;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleFulfilmentVisibilityImplCopyWith<_$ToggleFulfilmentVisibilityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TogglePayoutVisibilitiesImplCopyWith<$Res> {
  factory _$$TogglePayoutVisibilitiesImplCopyWith(
          _$TogglePayoutVisibilitiesImpl value,
          $Res Function(_$TogglePayoutVisibilitiesImpl) then) =
      __$$TogglePayoutVisibilitiesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, TransactionDetailsState state});

  $TransactionDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$TogglePayoutVisibilitiesImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res,
        _$TogglePayoutVisibilitiesImpl>
    implements _$$TogglePayoutVisibilitiesImplCopyWith<$Res> {
  __$$TogglePayoutVisibilitiesImplCopyWithImpl(
      _$TogglePayoutVisibilitiesImpl _value,
      $Res Function(_$TogglePayoutVisibilitiesImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? state = null,
  }) {
    return _then(_$TogglePayoutVisibilitiesImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$TogglePayoutVisibilitiesImpl implements TogglePayoutVisibilities {
  const _$TogglePayoutVisibilitiesImpl(this.index, this.state);

  @override
  final int index;
  @override
  final TransactionDetailsState state;

  @override
  String toString() {
    return 'TransactionDetailsEvent.togglePayoutVisibilities(index: $index, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TogglePayoutVisibilitiesImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, state);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TogglePayoutVisibilitiesImplCopyWith<_$TogglePayoutVisibilitiesImpl>
      get copyWith => __$$TogglePayoutVisibilitiesImplCopyWithImpl<
          _$TogglePayoutVisibilitiesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return togglePayoutVisibilities(index, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return togglePayoutVisibilities?.call(index, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (togglePayoutVisibilities != null) {
      return togglePayoutVisibilities(index, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return togglePayoutVisibilities(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return togglePayoutVisibilities?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (togglePayoutVisibilities != null) {
      return togglePayoutVisibilities(this);
    }
    return orElse();
  }
}

abstract class TogglePayoutVisibilities implements TransactionDetailsEvent {
  const factory TogglePayoutVisibilities(
          final int index, final TransactionDetailsState state) =
      _$TogglePayoutVisibilitiesImpl;

  int get index;
  TransactionDetailsState get state;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TogglePayoutVisibilitiesImplCopyWith<_$TogglePayoutVisibilitiesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddTokenImplCopyWith<$Res> {
  factory _$$AddTokenImplCopyWith(
          _$AddTokenImpl value, $Res Function(_$AddTokenImpl) then) =
      __$$AddTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      String token,
      TransactionDetailsState state,
      Transaction transaction});

  $TransactionDetailsStateCopyWith<$Res> get state;
  $TransactionCopyWith<$Res> get transaction;
}

/// @nodoc
class __$$AddTokenImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res, _$AddTokenImpl>
    implements _$$AddTokenImplCopyWith<$Res> {
  __$$AddTokenImplCopyWithImpl(
      _$AddTokenImpl _value, $Res Function(_$AddTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? token = null,
    Object? state = null,
    Object? transaction = null,
  }) {
    return _then(_$AddTokenImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
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

class _$AddTokenImpl implements AddToken {
  const _$AddTokenImpl(this.id, this.token, this.state, this.transaction);

  @override
  final int id;
  @override
  final String token;
  @override
  final TransactionDetailsState state;
  @override
  final Transaction transaction;

  @override
  String toString() {
    return 'TransactionDetailsEvent.addToken(id: $id, token: $token, state: $state, transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTokenImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, token, state, transaction);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTokenImplCopyWith<_$AddTokenImpl> get copyWith =>
      __$$AddTokenImplCopyWithImpl<_$AddTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return addToken(id, token, state, transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return addToken?.call(id, token, state, transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (addToken != null) {
      return addToken(id, token, state, transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return addToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return addToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (addToken != null) {
      return addToken(this);
    }
    return orElse();
  }
}

abstract class AddToken implements TransactionDetailsEvent {
  const factory AddToken(
      final int id,
      final String token,
      final TransactionDetailsState state,
      final Transaction transaction) = _$AddTokenImpl;

  int get id;
  String get token;
  TransactionDetailsState get state;
  Transaction get transaction;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTokenImplCopyWith<_$AddTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetObligationStatusImplCopyWith<$Res> {
  factory _$$SetObligationStatusImplCopyWith(_$SetObligationStatusImpl value,
          $Res Function(_$SetObligationStatusImpl) then) =
      __$$SetObligationStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      ObligationStatus status,
      TransactionDetailsState state,
      Transaction transaction});

  $TransactionDetailsStateCopyWith<$Res> get state;
  $TransactionCopyWith<$Res> get transaction;
}

/// @nodoc
class __$$SetObligationStatusImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res,
        _$SetObligationStatusImpl>
    implements _$$SetObligationStatusImplCopyWith<$Res> {
  __$$SetObligationStatusImplCopyWithImpl(_$SetObligationStatusImpl _value,
      $Res Function(_$SetObligationStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? state = null,
    Object? transaction = null,
  }) {
    return _then(_$SetObligationStatusImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ObligationStatus,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
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
      this.id, this.status, this.state, this.transaction);

  @override
  final int id;
  @override
  final ObligationStatus status;
  @override
  final TransactionDetailsState state;
  @override
  final Transaction transaction;

  @override
  String toString() {
    return 'TransactionDetailsEvent.setObligationStatus(id: $id, status: $status, state: $state, transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetObligationStatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, status, state, transaction);

  /// Create a copy of TransactionDetailsEvent
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
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return setObligationStatus(id, status, state, transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return setObligationStatus?.call(id, status, state, transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (setObligationStatus != null) {
      return setObligationStatus(id, status, state, transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return setObligationStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return setObligationStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (setObligationStatus != null) {
      return setObligationStatus(this);
    }
    return orElse();
  }
}

abstract class SetObligationStatus implements TransactionDetailsEvent {
  const factory SetObligationStatus(
      final int id,
      final ObligationStatus status,
      final TransactionDetailsState state,
      final Transaction transaction) = _$SetObligationStatusImpl;

  int get id;
  ObligationStatus get status;
  TransactionDetailsState get state;
  Transaction get transaction;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetObligationStatusImplCopyWith<_$SetObligationStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyObligationImplCopyWith<$Res> {
  factory _$$VerifyObligationImplCopyWith(_$VerifyObligationImpl value,
          $Res Function(_$VerifyObligationImpl) then) =
      __$$VerifyObligationImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      String token,
      Obligation obligation,
      TransactionDetailsState state});

  $ObligationCopyWith<$Res> get obligation;
  $TransactionDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$VerifyObligationImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res, _$VerifyObligationImpl>
    implements _$$VerifyObligationImplCopyWith<$Res> {
  __$$VerifyObligationImplCopyWithImpl(_$VerifyObligationImpl _value,
      $Res Function(_$VerifyObligationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? token = null,
    Object? obligation = null,
    Object? state = null,
  }) {
    return _then(_$VerifyObligationImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      null == obligation
          ? _value.obligation
          : obligation // ignore: cast_nullable_to_non_nullable
              as Obligation,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ObligationCopyWith<$Res> get obligation {
    return $ObligationCopyWith<$Res>(_value.obligation, (value) {
      return _then(_value.copyWith(obligation: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$VerifyObligationImpl implements VerifyObligation {
  const _$VerifyObligationImpl(
      this.id, this.token, this.obligation, this.state);

  @override
  final int id;
  @override
  final String token;
  @override
  final Obligation obligation;
  @override
  final TransactionDetailsState state;

  @override
  String toString() {
    return 'TransactionDetailsEvent.verifyToken(id: $id, token: $token, obligation: $obligation, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyObligationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.obligation, obligation) ||
                other.obligation == obligation) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, token, obligation, state);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyObligationImplCopyWith<_$VerifyObligationImpl> get copyWith =>
      __$$VerifyObligationImplCopyWithImpl<_$VerifyObligationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return verifyToken(id, token, obligation, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return verifyToken?.call(id, token, obligation, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (verifyToken != null) {
      return verifyToken(id, token, obligation, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return verifyToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return verifyToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (verifyToken != null) {
      return verifyToken(this);
    }
    return orElse();
  }
}

abstract class VerifyObligation implements TransactionDetailsEvent {
  const factory VerifyObligation(
      final int id,
      final String token,
      final Obligation obligation,
      final TransactionDetailsState state) = _$VerifyObligationImpl;

  int get id;
  String get token;
  Obligation get obligation;
  TransactionDetailsState get state;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyObligationImplCopyWith<_$VerifyObligationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AcceptTransactionImplCopyWith<$Res> {
  factory _$$AcceptTransactionImplCopyWith(_$AcceptTransactionImpl value,
          $Res Function(_$AcceptTransactionImpl) then) =
      __$$AcceptTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      Transaction transaction,
      BuildContext context,
      TransactionDetailsState state});

  $UserCopyWith<$Res> get user;
  $TransactionCopyWith<$Res> get transaction;
  $TransactionDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$AcceptTransactionImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res, _$AcceptTransactionImpl>
    implements _$$AcceptTransactionImplCopyWith<$Res> {
  __$$AcceptTransactionImplCopyWithImpl(_$AcceptTransactionImpl _value,
      $Res Function(_$AcceptTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? transaction = null,
    Object? context = null,
    Object? state = null,
  }) {
    return _then(_$AcceptTransactionImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$AcceptTransactionImpl implements AcceptTransaction {
  const _$AcceptTransactionImpl(
      this.user, this.transaction, this.context, this.state);

  @override
  final User user;
  @override
  final Transaction transaction;
  @override
  final BuildContext context;
  @override
  final TransactionDetailsState state;

  @override
  String toString() {
    return 'TransactionDetailsEvent.acceptTransaction(user: $user, transaction: $transaction, context: $context, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptTransactionImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, transaction, context, state);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptTransactionImplCopyWith<_$AcceptTransactionImpl> get copyWith =>
      __$$AcceptTransactionImplCopyWithImpl<_$AcceptTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return acceptTransaction(user, transaction, context, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return acceptTransaction?.call(user, transaction, context, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (acceptTransaction != null) {
      return acceptTransaction(user, transaction, context, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return acceptTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return acceptTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (acceptTransaction != null) {
      return acceptTransaction(this);
    }
    return orElse();
  }
}

abstract class AcceptTransaction implements TransactionDetailsEvent {
  const factory AcceptTransaction(
      final User user,
      final Transaction transaction,
      final BuildContext context,
      final TransactionDetailsState state) = _$AcceptTransactionImpl;

  User get user;
  Transaction get transaction;
  BuildContext get context;
  TransactionDetailsState get state;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcceptTransactionImplCopyWith<_$AcceptTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeclineTransactionImplCopyWith<$Res> {
  factory _$$DeclineTransactionImplCopyWith(_$DeclineTransactionImpl value,
          $Res Function(_$DeclineTransactionImpl) then) =
      __$$DeclineTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      String note,
      Transaction transaction,
      BuildContext context,
      TransactionDetailsState state});

  $UserCopyWith<$Res> get user;
  $TransactionCopyWith<$Res> get transaction;
  $TransactionDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$DeclineTransactionImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res,
        _$DeclineTransactionImpl>
    implements _$$DeclineTransactionImplCopyWith<$Res> {
  __$$DeclineTransactionImplCopyWithImpl(_$DeclineTransactionImpl _value,
      $Res Function(_$DeclineTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? note = null,
    Object? transaction = null,
    Object? context = null,
    Object? state = null,
  }) {
    return _then(_$DeclineTransactionImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$DeclineTransactionImpl implements DeclineTransaction {
  const _$DeclineTransactionImpl(
      this.user, this.note, this.transaction, this.context, this.state);

  @override
  final User user;
  @override
  final String note;
  @override
  final Transaction transaction;
  @override
  final BuildContext context;
  @override
  final TransactionDetailsState state;

  @override
  String toString() {
    return 'TransactionDetailsEvent.declineTransaction(user: $user, note: $note, transaction: $transaction, context: $context, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclineTransactionImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, note, transaction, context, state);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclineTransactionImplCopyWith<_$DeclineTransactionImpl> get copyWith =>
      __$$DeclineTransactionImplCopyWithImpl<_$DeclineTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return declineTransaction(user, note, transaction, context, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return declineTransaction?.call(user, note, transaction, context, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (declineTransaction != null) {
      return declineTransaction(user, note, transaction, context, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return declineTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return declineTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (declineTransaction != null) {
      return declineTransaction(this);
    }
    return orElse();
  }
}

abstract class DeclineTransaction implements TransactionDetailsEvent {
  const factory DeclineTransaction(
      final User user,
      final String note,
      final Transaction transaction,
      final BuildContext context,
      final TransactionDetailsState state) = _$DeclineTransactionImpl;

  User get user;
  String get note;
  Transaction get transaction;
  BuildContext get context;
  TransactionDetailsState get state;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeclineTransactionImplCopyWith<_$DeclineTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentTransactionImplCopyWith<$Res> {
  factory _$$PaymentTransactionImplCopyWith(_$PaymentTransactionImpl value,
          $Res Function(_$PaymentTransactionImpl) then) =
      __$$PaymentTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      Obligation obligation,
      Transaction transaction,
      BuildContext context,
      PaymentType paymentType,
      TransactionDetailsState state});

  $UserCopyWith<$Res> get user;
  $ObligationCopyWith<$Res> get obligation;
  $TransactionCopyWith<$Res> get transaction;
  $TransactionDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$PaymentTransactionImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res,
        _$PaymentTransactionImpl>
    implements _$$PaymentTransactionImplCopyWith<$Res> {
  __$$PaymentTransactionImplCopyWithImpl(_$PaymentTransactionImpl _value,
      $Res Function(_$PaymentTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? obligation = null,
    Object? transaction = null,
    Object? context = null,
    Object? paymentType = null,
    Object? state = null,
  }) {
    return _then(_$PaymentTransactionImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      null == obligation
          ? _value.obligation
          : obligation // ignore: cast_nullable_to_non_nullable
              as Obligation,
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PaymentType,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ObligationCopyWith<$Res> get obligation {
    return $ObligationCopyWith<$Res>(_value.obligation, (value) {
      return _then(_value.copyWith(obligation: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$PaymentTransactionImpl implements PaymentTransaction {
  const _$PaymentTransactionImpl(this.user, this.obligation, this.transaction,
      this.context, this.paymentType, this.state);

  @override
  final User user;
  @override
  final Obligation obligation;
  @override
  final Transaction transaction;
  @override
  final BuildContext context;
  @override
  final PaymentType paymentType;
  @override
  final TransactionDetailsState state;

  @override
  String toString() {
    return 'TransactionDetailsEvent.makeTransactionPayment(user: $user, obligation: $obligation, transaction: $transaction, context: $context, paymentType: $paymentType, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentTransactionImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.obligation, obligation) ||
                other.obligation == obligation) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, obligation, transaction, context, paymentType, state);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentTransactionImplCopyWith<_$PaymentTransactionImpl> get copyWith =>
      __$$PaymentTransactionImplCopyWithImpl<_$PaymentTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return makeTransactionPayment(
        user, obligation, transaction, context, paymentType, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return makeTransactionPayment?.call(
        user, obligation, transaction, context, paymentType, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (makeTransactionPayment != null) {
      return makeTransactionPayment(
          user, obligation, transaction, context, paymentType, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return makeTransactionPayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return makeTransactionPayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (makeTransactionPayment != null) {
      return makeTransactionPayment(this);
    }
    return orElse();
  }
}

abstract class PaymentTransaction implements TransactionDetailsEvent {
  const factory PaymentTransaction(
      final User user,
      final Obligation obligation,
      final Transaction transaction,
      final BuildContext context,
      final PaymentType paymentType,
      final TransactionDetailsState state) = _$PaymentTransactionImpl;

  User get user;
  Obligation get obligation;
  Transaction get transaction;
  BuildContext get context;
  PaymentType get paymentType;
  TransactionDetailsState get state;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentTransactionImplCopyWith<_$PaymentTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelTransactionImplCopyWith<$Res> {
  factory _$$CancelTransactionImplCopyWith(_$CancelTransactionImpl value,
          $Res Function(_$CancelTransactionImpl) then) =
      __$$CancelTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      Transaction transaction,
      String note,
      BuildContext context,
      TransactionDetailsState state});

  $UserCopyWith<$Res> get user;
  $TransactionCopyWith<$Res> get transaction;
  $TransactionDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$CancelTransactionImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res, _$CancelTransactionImpl>
    implements _$$CancelTransactionImplCopyWith<$Res> {
  __$$CancelTransactionImplCopyWithImpl(_$CancelTransactionImpl _value,
      $Res Function(_$CancelTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? transaction = null,
    Object? note = null,
    Object? context = null,
    Object? state = null,
  }) {
    return _then(_$CancelTransactionImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$CancelTransactionImpl implements CancelTransaction {
  const _$CancelTransactionImpl(
      this.user, this.transaction, this.note, this.context, this.state);

  @override
  final User user;
  @override
  final Transaction transaction;
  @override
  final String note;
  @override
  final BuildContext context;
  @override
  final TransactionDetailsState state;

  @override
  String toString() {
    return 'TransactionDetailsEvent.cancelTransaction(user: $user, transaction: $transaction, note: $note, context: $context, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelTransactionImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, transaction, note, context, state);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelTransactionImplCopyWith<_$CancelTransactionImpl> get copyWith =>
      __$$CancelTransactionImplCopyWithImpl<_$CancelTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return cancelTransaction(user, transaction, note, context, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return cancelTransaction?.call(user, transaction, note, context, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (cancelTransaction != null) {
      return cancelTransaction(user, transaction, note, context, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return cancelTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return cancelTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (cancelTransaction != null) {
      return cancelTransaction(this);
    }
    return orElse();
  }
}

abstract class CancelTransaction implements TransactionDetailsEvent {
  const factory CancelTransaction(
      final User user,
      final Transaction transaction,
      final String note,
      final BuildContext context,
      final TransactionDetailsState state) = _$CancelTransactionImpl;

  User get user;
  Transaction get transaction;
  String get note;
  BuildContext get context;
  TransactionDetailsState get state;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelTransactionImplCopyWith<_$CancelTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExtendTransactionImplCopyWith<$Res> {
  factory _$$ExtendTransactionImplCopyWith(_$ExtendTransactionImpl value,
          $Res Function(_$ExtendTransactionImpl) then) =
      __$$ExtendTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      DateTime date,
      Transaction transaction,
      BuildContext context,
      TransactionDetailsState state});

  $UserCopyWith<$Res> get user;
  $TransactionCopyWith<$Res> get transaction;
  $TransactionDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$ExtendTransactionImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res, _$ExtendTransactionImpl>
    implements _$$ExtendTransactionImplCopyWith<$Res> {
  __$$ExtendTransactionImplCopyWithImpl(_$ExtendTransactionImpl _value,
      $Res Function(_$ExtendTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? date = null,
    Object? transaction = null,
    Object? context = null,
    Object? state = null,
  }) {
    return _then(_$ExtendTransactionImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$ExtendTransactionImpl implements ExtendTransaction {
  const _$ExtendTransactionImpl(
      this.user, this.date, this.transaction, this.context, this.state);

  @override
  final User user;
  @override
  final DateTime date;
  @override
  final Transaction transaction;
  @override
  final BuildContext context;
  @override
  final TransactionDetailsState state;

  @override
  String toString() {
    return 'TransactionDetailsEvent.extendTransactionDueDate(user: $user, date: $date, transaction: $transaction, context: $context, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtendTransactionImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, date, transaction, context, state);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtendTransactionImplCopyWith<_$ExtendTransactionImpl> get copyWith =>
      __$$ExtendTransactionImplCopyWithImpl<_$ExtendTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return extendTransactionDueDate(user, date, transaction, context, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return extendTransactionDueDate?.call(
        user, date, transaction, context, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (extendTransactionDueDate != null) {
      return extendTransactionDueDate(user, date, transaction, context, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return extendTransactionDueDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return extendTransactionDueDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (extendTransactionDueDate != null) {
      return extendTransactionDueDate(this);
    }
    return orElse();
  }
}

abstract class ExtendTransaction implements TransactionDetailsEvent {
  const factory ExtendTransaction(
      final User user,
      final DateTime date,
      final Transaction transaction,
      final BuildContext context,
      final TransactionDetailsState state) = _$ExtendTransactionImpl;

  User get user;
  DateTime get date;
  Transaction get transaction;
  BuildContext get context;
  TransactionDetailsState get state;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtendTransactionImplCopyWith<_$ExtendTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ComplaintTransactionImplCopyWith<$Res> {
  factory _$$ComplaintTransactionImplCopyWith(_$ComplaintTransactionImpl value,
          $Res Function(_$ComplaintTransactionImpl) then) =
      __$$ComplaintTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      String note,
      Transaction transaction,
      BuildContext context,
      TransactionDetailsState state});

  $UserCopyWith<$Res> get user;
  $TransactionCopyWith<$Res> get transaction;
  $TransactionDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$ComplaintTransactionImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res,
        _$ComplaintTransactionImpl>
    implements _$$ComplaintTransactionImplCopyWith<$Res> {
  __$$ComplaintTransactionImplCopyWithImpl(_$ComplaintTransactionImpl _value,
      $Res Function(_$ComplaintTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? note = null,
    Object? transaction = null,
    Object? context = null,
    Object? state = null,
  }) {
    return _then(_$ComplaintTransactionImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$ComplaintTransactionImpl implements ComplaintTransaction {
  const _$ComplaintTransactionImpl(
      this.user, this.note, this.transaction, this.context, this.state);

  @override
  final User user;
  @override
  final String note;
  @override
  final Transaction transaction;
  @override
  final BuildContext context;
  @override
  final TransactionDetailsState state;

  @override
  String toString() {
    return 'TransactionDetailsEvent.createTransactionComplaint(user: $user, note: $note, transaction: $transaction, context: $context, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplaintTransactionImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, note, transaction, context, state);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplaintTransactionImplCopyWith<_$ComplaintTransactionImpl>
      get copyWith =>
          __$$ComplaintTransactionImplCopyWithImpl<_$ComplaintTransactionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return createTransactionComplaint(user, note, transaction, context, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return createTransactionComplaint?.call(
        user, note, transaction, context, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (createTransactionComplaint != null) {
      return createTransactionComplaint(
          user, note, transaction, context, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return createTransactionComplaint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return createTransactionComplaint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (createTransactionComplaint != null) {
      return createTransactionComplaint(this);
    }
    return orElse();
  }
}

abstract class ComplaintTransaction implements TransactionDetailsEvent {
  const factory ComplaintTransaction(
      final User user,
      final String note,
      final Transaction transaction,
      final BuildContext context,
      final TransactionDetailsState state) = _$ComplaintTransactionImpl;

  User get user;
  String get note;
  Transaction get transaction;
  BuildContext get context;
  TransactionDetailsState get state;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComplaintTransactionImplCopyWith<_$ComplaintTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FulfillTransactionObligationImplCopyWith<$Res> {
  factory _$$FulfillTransactionObligationImplCopyWith(
          _$FulfillTransactionObligationImpl value,
          $Res Function(_$FulfillTransactionObligationImpl) then) =
      __$$FulfillTransactionObligationImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      Obligation obligation,
      Transaction transaction,
      BuildContext context,
      TransactionDetailsState state});

  $UserCopyWith<$Res> get user;
  $ObligationCopyWith<$Res> get obligation;
  $TransactionCopyWith<$Res> get transaction;
  $TransactionDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$FulfillTransactionObligationImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res,
        _$FulfillTransactionObligationImpl>
    implements _$$FulfillTransactionObligationImplCopyWith<$Res> {
  __$$FulfillTransactionObligationImplCopyWithImpl(
      _$FulfillTransactionObligationImpl _value,
      $Res Function(_$FulfillTransactionObligationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? obligation = null,
    Object? transaction = null,
    Object? context = null,
    Object? state = null,
  }) {
    return _then(_$FulfillTransactionObligationImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      null == obligation
          ? _value.obligation
          : obligation // ignore: cast_nullable_to_non_nullable
              as Obligation,
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ObligationCopyWith<$Res> get obligation {
    return $ObligationCopyWith<$Res>(_value.obligation, (value) {
      return _then(_value.copyWith(obligation: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$FulfillTransactionObligationImpl
    implements FulfillTransactionObligation {
  const _$FulfillTransactionObligationImpl(
      this.user, this.obligation, this.transaction, this.context, this.state);

  @override
  final User user;
  @override
  final Obligation obligation;
  @override
  final Transaction transaction;
  @override
  final BuildContext context;
  @override
  final TransactionDetailsState state;

  @override
  String toString() {
    return 'TransactionDetailsEvent.fulfillTransactionObligation(user: $user, obligation: $obligation, transaction: $transaction, context: $context, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FulfillTransactionObligationImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.obligation, obligation) ||
                other.obligation == obligation) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, obligation, transaction, context, state);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FulfillTransactionObligationImplCopyWith<
          _$FulfillTransactionObligationImpl>
      get copyWith => __$$FulfillTransactionObligationImplCopyWithImpl<
          _$FulfillTransactionObligationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return fulfillTransactionObligation(
        user, obligation, transaction, context, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return fulfillTransactionObligation?.call(
        user, obligation, transaction, context, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (fulfillTransactionObligation != null) {
      return fulfillTransactionObligation(
          user, obligation, transaction, context, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return fulfillTransactionObligation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return fulfillTransactionObligation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (fulfillTransactionObligation != null) {
      return fulfillTransactionObligation(this);
    }
    return orElse();
  }
}

abstract class FulfillTransactionObligation implements TransactionDetailsEvent {
  const factory FulfillTransactionObligation(
      final User user,
      final Obligation obligation,
      final Transaction transaction,
      final BuildContext context,
      final TransactionDetailsState state) = _$FulfillTransactionObligationImpl;

  User get user;
  Obligation get obligation;
  Transaction get transaction;
  BuildContext get context;
  TransactionDetailsState get state;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FulfillTransactionObligationImplCopyWith<
          _$FulfillTransactionObligationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyTransactionObligationImplCopyWith<$Res> {
  factory _$$VerifyTransactionObligationImplCopyWith(
          _$VerifyTransactionObligationImpl value,
          $Res Function(_$VerifyTransactionObligationImpl) then) =
      __$$VerifyTransactionObligationImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      Obligation obligation,
      Transaction transaction,
      BuildContext context,
      TransactionDetailsState state});

  $UserCopyWith<$Res> get user;
  $ObligationCopyWith<$Res> get obligation;
  $TransactionCopyWith<$Res> get transaction;
  $TransactionDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$VerifyTransactionObligationImplCopyWithImpl<$Res>
    extends _$TransactionDetailsEventCopyWithImpl<$Res,
        _$VerifyTransactionObligationImpl>
    implements _$$VerifyTransactionObligationImplCopyWith<$Res> {
  __$$VerifyTransactionObligationImplCopyWithImpl(
      _$VerifyTransactionObligationImpl _value,
      $Res Function(_$VerifyTransactionObligationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? obligation = null,
    Object? transaction = null,
    Object? context = null,
    Object? state = null,
  }) {
    return _then(_$VerifyTransactionObligationImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      null == obligation
          ? _value.obligation
          : obligation // ignore: cast_nullable_to_non_nullable
              as Obligation,
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsState,
    ));
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ObligationCopyWith<$Res> get obligation {
    return $ObligationCopyWith<$Res>(_value.obligation, (value) {
      return _then(_value.copyWith(obligation: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionDetailsStateCopyWith<$Res> get state {
    return $TransactionDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$VerifyTransactionObligationImpl implements VerifyTransactionObligation {
  const _$VerifyTransactionObligationImpl(
      this.user, this.obligation, this.transaction, this.context, this.state);

  @override
  final User user;
  @override
  final Obligation obligation;
  @override
  final Transaction transaction;
  @override
  final BuildContext context;
  @override
  final TransactionDetailsState state;

  @override
  String toString() {
    return 'TransactionDetailsEvent.verifyTransactionObligation(user: $user, obligation: $obligation, transaction: $transaction, context: $context, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyTransactionObligationImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.obligation, obligation) ||
                other.obligation == obligation) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, obligation, transaction, context, state);

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyTransactionObligationImplCopyWith<_$VerifyTransactionObligationImpl>
      get copyWith => __$$VerifyTransactionObligationImplCopyWithImpl<
          _$VerifyTransactionObligationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transaction transaction) init,
    required TResult Function(int index, TransactionDetailsState state)
        toggleTokenVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        toggleFulfilmentVisibility,
    required TResult Function(int index, TransactionDetailsState state)
        togglePayoutVisibilities,
    required TResult Function(int id, String token,
            TransactionDetailsState state, Transaction transaction)
        addToken,
    required TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)
        setObligationStatus,
    required TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)
        verifyToken,
    required TResult Function(User user, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        acceptTransaction,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        declineTransaction,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)
        makeTransactionPayment,
    required TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)
        cancelTransaction,
    required TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        extendTransactionDueDate,
    required TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)
        createTransactionComplaint,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        fulfillTransactionObligation,
    required TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            TransactionDetailsState state)
        verifyTransactionObligation,
  }) {
    return verifyTransactionObligation(
        user, obligation, transaction, context, state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transaction transaction)? init,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult? Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult? Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult? Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult? Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult? Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult? Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult? Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult? Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult? Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult? Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
  }) {
    return verifyTransactionObligation?.call(
        user, obligation, transaction, context, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transaction transaction)? init,
    TResult Function(int index, TransactionDetailsState state)?
        toggleTokenVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        toggleFulfilmentVisibility,
    TResult Function(int index, TransactionDetailsState state)?
        togglePayoutVisibilities,
    TResult Function(int id, String token, TransactionDetailsState state,
            Transaction transaction)?
        addToken,
    TResult Function(int id, ObligationStatus status,
            TransactionDetailsState state, Transaction transaction)?
        setObligationStatus,
    TResult Function(int id, String token, Obligation obligation,
            TransactionDetailsState state)?
        verifyToken,
    TResult Function(User user, Transaction transaction, BuildContext context,
            TransactionDetailsState state)?
        acceptTransaction,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        declineTransaction,
    TResult Function(
            User user,
            Obligation obligation,
            Transaction transaction,
            BuildContext context,
            PaymentType paymentType,
            TransactionDetailsState state)?
        makeTransactionPayment,
    TResult Function(User user, Transaction transaction, String note,
            BuildContext context, TransactionDetailsState state)?
        cancelTransaction,
    TResult Function(User user, DateTime date, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        extendTransactionDueDate,
    TResult Function(User user, String note, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        createTransactionComplaint,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        fulfillTransactionObligation,
    TResult Function(User user, Obligation obligation, Transaction transaction,
            BuildContext context, TransactionDetailsState state)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (verifyTransactionObligation != null) {
      return verifyTransactionObligation(
          user, obligation, transaction, context, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(ToggleTokenVisibility value)
        toggleTokenVisibility,
    required TResult Function(ToggleFulfilmentVisibility value)
        toggleFulfilmentVisibility,
    required TResult Function(TogglePayoutVisibilities value)
        togglePayoutVisibilities,
    required TResult Function(AddToken value) addToken,
    required TResult Function(SetObligationStatus value) setObligationStatus,
    required TResult Function(VerifyObligation value) verifyToken,
    required TResult Function(AcceptTransaction value) acceptTransaction,
    required TResult Function(DeclineTransaction value) declineTransaction,
    required TResult Function(PaymentTransaction value) makeTransactionPayment,
    required TResult Function(CancelTransaction value) cancelTransaction,
    required TResult Function(ExtendTransaction value) extendTransactionDueDate,
    required TResult Function(ComplaintTransaction value)
        createTransactionComplaint,
    required TResult Function(FulfillTransactionObligation value)
        fulfillTransactionObligation,
    required TResult Function(VerifyTransactionObligation value)
        verifyTransactionObligation,
  }) {
    return verifyTransactionObligation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult? Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult? Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult? Function(AddToken value)? addToken,
    TResult? Function(SetObligationStatus value)? setObligationStatus,
    TResult? Function(VerifyObligation value)? verifyToken,
    TResult? Function(AcceptTransaction value)? acceptTransaction,
    TResult? Function(DeclineTransaction value)? declineTransaction,
    TResult? Function(PaymentTransaction value)? makeTransactionPayment,
    TResult? Function(CancelTransaction value)? cancelTransaction,
    TResult? Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult? Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult? Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult? Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
  }) {
    return verifyTransactionObligation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(ToggleTokenVisibility value)? toggleTokenVisibility,
    TResult Function(ToggleFulfilmentVisibility value)?
        toggleFulfilmentVisibility,
    TResult Function(TogglePayoutVisibilities value)? togglePayoutVisibilities,
    TResult Function(AddToken value)? addToken,
    TResult Function(SetObligationStatus value)? setObligationStatus,
    TResult Function(VerifyObligation value)? verifyToken,
    TResult Function(AcceptTransaction value)? acceptTransaction,
    TResult Function(DeclineTransaction value)? declineTransaction,
    TResult Function(PaymentTransaction value)? makeTransactionPayment,
    TResult Function(CancelTransaction value)? cancelTransaction,
    TResult Function(ExtendTransaction value)? extendTransactionDueDate,
    TResult Function(ComplaintTransaction value)? createTransactionComplaint,
    TResult Function(FulfillTransactionObligation value)?
        fulfillTransactionObligation,
    TResult Function(VerifyTransactionObligation value)?
        verifyTransactionObligation,
    required TResult orElse(),
  }) {
    if (verifyTransactionObligation != null) {
      return verifyTransactionObligation(this);
    }
    return orElse();
  }
}

abstract class VerifyTransactionObligation implements TransactionDetailsEvent {
  const factory VerifyTransactionObligation(
      final User user,
      final Obligation obligation,
      final Transaction transaction,
      final BuildContext context,
      final TransactionDetailsState state) = _$VerifyTransactionObligationImpl;

  User get user;
  Obligation get obligation;
  Transaction get transaction;
  BuildContext get context;
  TransactionDetailsState get state;

  /// Create a copy of TransactionDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyTransactionObligationImplCopyWith<_$VerifyTransactionObligationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionDetailsState {
  TransactionDetailsBlocStatus get state => throw _privateConstructorUsedError;
  Transaction? get transaction => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  Obligation? get obligation => throw _privateConstructorUsedError;
  List<String> get tokens => throw _privateConstructorUsedError;
  List<bool> get tokenVisibilities => throw _privateConstructorUsedError;
  List<bool> get payoutVisibilities => throw _privateConstructorUsedError;
  List<bool> get fulfilmentVisibilities => throw _privateConstructorUsedError;
  Set<DateTime> get fulfilmentDates => throw _privateConstructorUsedError;

  /// Create a copy of TransactionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionDetailsStateCopyWith<TransactionDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailsStateCopyWith<$Res> {
  factory $TransactionDetailsStateCopyWith(TransactionDetailsState value,
          $Res Function(TransactionDetailsState) then) =
      _$TransactionDetailsStateCopyWithImpl<$Res, TransactionDetailsState>;
  @useResult
  $Res call(
      {TransactionDetailsBlocStatus state,
      Transaction? transaction,
      String errorMessage,
      Obligation? obligation,
      List<String> tokens,
      List<bool> tokenVisibilities,
      List<bool> payoutVisibilities,
      List<bool> fulfilmentVisibilities,
      Set<DateTime> fulfilmentDates});

  $TransactionCopyWith<$Res>? get transaction;
  $ObligationCopyWith<$Res>? get obligation;
}

/// @nodoc
class _$TransactionDetailsStateCopyWithImpl<$Res,
        $Val extends TransactionDetailsState>
    implements $TransactionDetailsStateCopyWith<$Res> {
  _$TransactionDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? transaction = freezed,
    Object? errorMessage = null,
    Object? obligation = freezed,
    Object? tokens = null,
    Object? tokenVisibilities = null,
    Object? payoutVisibilities = null,
    Object? fulfilmentVisibilities = null,
    Object? fulfilmentDates = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsBlocStatus,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      obligation: freezed == obligation
          ? _value.obligation
          : obligation // ignore: cast_nullable_to_non_nullable
              as Obligation?,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tokenVisibilities: null == tokenVisibilities
          ? _value.tokenVisibilities
          : tokenVisibilities // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      payoutVisibilities: null == payoutVisibilities
          ? _value.payoutVisibilities
          : payoutVisibilities // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      fulfilmentVisibilities: null == fulfilmentVisibilities
          ? _value.fulfilmentVisibilities
          : fulfilmentVisibilities // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      fulfilmentDates: null == fulfilmentDates
          ? _value.fulfilmentDates
          : fulfilmentDates // ignore: cast_nullable_to_non_nullable
              as Set<DateTime>,
    ) as $Val);
  }

  /// Create a copy of TransactionDetailsState
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

  /// Create a copy of TransactionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ObligationCopyWith<$Res>? get obligation {
    if (_value.obligation == null) {
      return null;
    }

    return $ObligationCopyWith<$Res>(_value.obligation!, (value) {
      return _then(_value.copyWith(obligation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TransactionDetailsStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransactionDetailsBlocStatus state,
      Transaction? transaction,
      String errorMessage,
      Obligation? obligation,
      List<String> tokens,
      List<bool> tokenVisibilities,
      List<bool> payoutVisibilities,
      List<bool> fulfilmentVisibilities,
      Set<DateTime> fulfilmentDates});

  @override
  $TransactionCopyWith<$Res>? get transaction;
  @override
  $ObligationCopyWith<$Res>? get obligation;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TransactionDetailsStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? transaction = freezed,
    Object? errorMessage = null,
    Object? obligation = freezed,
    Object? tokens = null,
    Object? tokenVisibilities = null,
    Object? payoutVisibilities = null,
    Object? fulfilmentVisibilities = null,
    Object? fulfilmentDates = null,
  }) {
    return _then(_$InitialImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsBlocStatus,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      obligation: freezed == obligation
          ? _value.obligation
          : obligation // ignore: cast_nullable_to_non_nullable
              as Obligation?,
      tokens: null == tokens
          ? _value._tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tokenVisibilities: null == tokenVisibilities
          ? _value._tokenVisibilities
          : tokenVisibilities // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      payoutVisibilities: null == payoutVisibilities
          ? _value._payoutVisibilities
          : payoutVisibilities // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      fulfilmentVisibilities: null == fulfilmentVisibilities
          ? _value._fulfilmentVisibilities
          : fulfilmentVisibilities // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      fulfilmentDates: null == fulfilmentDates
          ? _value._fulfilmentDates
          : fulfilmentDates // ignore: cast_nullable_to_non_nullable
              as Set<DateTime>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.state = TransactionDetailsBlocStatus.initial,
      this.transaction = null,
      this.errorMessage = '',
      this.obligation = null,
      required final List<String> tokens,
      required final List<bool> tokenVisibilities,
      required final List<bool> payoutVisibilities,
      required final List<bool> fulfilmentVisibilities,
      required final Set<DateTime> fulfilmentDates})
      : _tokens = tokens,
        _tokenVisibilities = tokenVisibilities,
        _payoutVisibilities = payoutVisibilities,
        _fulfilmentVisibilities = fulfilmentVisibilities,
        _fulfilmentDates = fulfilmentDates;

  @override
  @JsonKey()
  final TransactionDetailsBlocStatus state;
  @override
  @JsonKey()
  final Transaction? transaction;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final Obligation? obligation;
  final List<String> _tokens;
  @override
  List<String> get tokens {
    if (_tokens is EqualUnmodifiableListView) return _tokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokens);
  }

  final List<bool> _tokenVisibilities;
  @override
  List<bool> get tokenVisibilities {
    if (_tokenVisibilities is EqualUnmodifiableListView)
      return _tokenVisibilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokenVisibilities);
  }

  final List<bool> _payoutVisibilities;
  @override
  List<bool> get payoutVisibilities {
    if (_payoutVisibilities is EqualUnmodifiableListView)
      return _payoutVisibilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payoutVisibilities);
  }

  final List<bool> _fulfilmentVisibilities;
  @override
  List<bool> get fulfilmentVisibilities {
    if (_fulfilmentVisibilities is EqualUnmodifiableListView)
      return _fulfilmentVisibilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fulfilmentVisibilities);
  }

  final Set<DateTime> _fulfilmentDates;
  @override
  Set<DateTime> get fulfilmentDates {
    if (_fulfilmentDates is EqualUnmodifiableSetView) return _fulfilmentDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_fulfilmentDates);
  }

  @override
  String toString() {
    return 'TransactionDetailsState(state: $state, transaction: $transaction, errorMessage: $errorMessage, obligation: $obligation, tokens: $tokens, tokenVisibilities: $tokenVisibilities, payoutVisibilities: $payoutVisibilities, fulfilmentVisibilities: $fulfilmentVisibilities, fulfilmentDates: $fulfilmentDates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.obligation, obligation) ||
                other.obligation == obligation) &&
            const DeepCollectionEquality().equals(other._tokens, _tokens) &&
            const DeepCollectionEquality()
                .equals(other._tokenVisibilities, _tokenVisibilities) &&
            const DeepCollectionEquality()
                .equals(other._payoutVisibilities, _payoutVisibilities) &&
            const DeepCollectionEquality().equals(
                other._fulfilmentVisibilities, _fulfilmentVisibilities) &&
            const DeepCollectionEquality()
                .equals(other._fulfilmentDates, _fulfilmentDates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      state,
      transaction,
      errorMessage,
      obligation,
      const DeepCollectionEquality().hash(_tokens),
      const DeepCollectionEquality().hash(_tokenVisibilities),
      const DeepCollectionEquality().hash(_payoutVisibilities),
      const DeepCollectionEquality().hash(_fulfilmentVisibilities),
      const DeepCollectionEquality().hash(_fulfilmentDates));

  /// Create a copy of TransactionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements TransactionDetailsState {
  const factory _Initial(
      {final TransactionDetailsBlocStatus state,
      final Transaction? transaction,
      final String errorMessage,
      final Obligation? obligation,
      required final List<String> tokens,
      required final List<bool> tokenVisibilities,
      required final List<bool> payoutVisibilities,
      required final List<bool> fulfilmentVisibilities,
      required final Set<DateTime> fulfilmentDates}) = _$InitialImpl;

  @override
  TransactionDetailsBlocStatus get state;
  @override
  Transaction? get transaction;
  @override
  String get errorMessage;
  @override
  Obligation? get obligation;
  @override
  List<String> get tokens;
  @override
  List<bool> get tokenVisibilities;
  @override
  List<bool> get payoutVisibilities;
  @override
  List<bool> get fulfilmentVisibilities;
  @override
  Set<DateTime> get fulfilmentDates;

  /// Create a copy of TransactionDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
