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
