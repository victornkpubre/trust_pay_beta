// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Obligation _$ObligationFromJson(Map<String, dynamic> json) {
  return _Obligation.fromJson(json);
}

/// @nodoc
mixin _$Obligation {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  ObligationStatus get status => throw _privateConstructorUsedError;
  ObligationType get type => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  int? get binding => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  /// Serializes this Obligation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Obligation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ObligationCopyWith<Obligation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ObligationCopyWith<$Res> {
  factory $ObligationCopyWith(
          Obligation value, $Res Function(Obligation) then) =
      _$ObligationCopyWithImpl<$Res, Obligation>;
  @useResult
  $Res call(
      {int? id,
      String title,
      ObligationStatus status,
      ObligationType type,
      DateTime dueDate,
      double amount,
      int? binding,
      String? details,
      String? token});
}

/// @nodoc
class _$ObligationCopyWithImpl<$Res, $Val extends Obligation>
    implements $ObligationCopyWith<$Res> {
  _$ObligationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Obligation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? status = null,
    Object? type = null,
    Object? dueDate = null,
    Object? amount = null,
    Object? binding = freezed,
    Object? details = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ObligationStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ObligationType,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      binding: freezed == binding
          ? _value.binding
          : binding // ignore: cast_nullable_to_non_nullable
              as int?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ObligationImplCopyWith<$Res>
    implements $ObligationCopyWith<$Res> {
  factory _$$ObligationImplCopyWith(
          _$ObligationImpl value, $Res Function(_$ObligationImpl) then) =
      __$$ObligationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      ObligationStatus status,
      ObligationType type,
      DateTime dueDate,
      double amount,
      int? binding,
      String? details,
      String? token});
}

/// @nodoc
class __$$ObligationImplCopyWithImpl<$Res>
    extends _$ObligationCopyWithImpl<$Res, _$ObligationImpl>
    implements _$$ObligationImplCopyWith<$Res> {
  __$$ObligationImplCopyWithImpl(
      _$ObligationImpl _value, $Res Function(_$ObligationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Obligation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? status = null,
    Object? type = null,
    Object? dueDate = null,
    Object? amount = null,
    Object? binding = freezed,
    Object? details = freezed,
    Object? token = freezed,
  }) {
    return _then(_$ObligationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ObligationStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ObligationType,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      binding: freezed == binding
          ? _value.binding
          : binding // ignore: cast_nullable_to_non_nullable
              as int?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ObligationImpl extends _Obligation {
  const _$ObligationImpl(
      {this.id,
      required this.title,
      required this.status,
      required this.type,
      required this.dueDate,
      required this.amount,
      this.binding,
      this.details,
      this.token})
      : super._();

  factory _$ObligationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ObligationImplFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final ObligationStatus status;
  @override
  final ObligationType type;
  @override
  final DateTime dueDate;
  @override
  final double amount;
  @override
  final int? binding;
  @override
  final String? details;
  @override
  final String? token;

  @override
  String toString() {
    return 'Obligation(id: $id, title: $title, status: $status, type: $type, dueDate: $dueDate, amount: $amount, binding: $binding, details: $details, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObligationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.binding, binding) || other.binding == binding) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, status, type, dueDate,
      amount, binding, details, token);

  /// Create a copy of Obligation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ObligationImplCopyWith<_$ObligationImpl> get copyWith =>
      __$$ObligationImplCopyWithImpl<_$ObligationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ObligationImplToJson(
      this,
    );
  }
}

abstract class _Obligation extends Obligation {
  const factory _Obligation(
      {final int? id,
      required final String title,
      required final ObligationStatus status,
      required final ObligationType type,
      required final DateTime dueDate,
      required final double amount,
      final int? binding,
      final String? details,
      final String? token}) = _$ObligationImpl;
  const _Obligation._() : super._();

  factory _Obligation.fromJson(Map<String, dynamic> json) =
      _$ObligationImpl.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  ObligationStatus get status;
  @override
  ObligationType get type;
  @override
  DateTime get dueDate;
  @override
  double get amount;
  @override
  int? get binding;
  @override
  String? get details;
  @override
  String? get token;

  /// Create a copy of Obligation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ObligationImplCopyWith<_$ObligationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionProof _$TransactionProofFromJson(Map<String, dynamic> json) {
  return _TransactionProof.fromJson(json);
}

/// @nodoc
mixin _$TransactionProof {
  int? get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  ProofMediaType get mediaType => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;
  bool get isMocked => throw _privateConstructorUsedError;
  DateTime get capturedAt => throw _privateConstructorUsedError;
  List<int> get obligationIds => throw _privateConstructorUsedError;

  /// Serializes this TransactionProof to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionProof
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionProofCopyWith<TransactionProof> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionProofCopyWith<$Res> {
  factory $TransactionProofCopyWith(
          TransactionProof value, $Res Function(TransactionProof) then) =
      _$TransactionProofCopyWithImpl<$Res, TransactionProof>;
  @useResult
  $Res call(
      {int? id,
      int userId,
      ProofMediaType mediaType,
      String url,
      double latitude,
      double longitude,
      double? accuracy,
      bool isMocked,
      DateTime capturedAt,
      List<int> obligationIds});
}

/// @nodoc
class _$TransactionProofCopyWithImpl<$Res, $Val extends TransactionProof>
    implements $TransactionProofCopyWith<$Res> {
  _$TransactionProofCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionProof
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? mediaType = null,
    Object? url = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracy = freezed,
    Object? isMocked = null,
    Object? capturedAt = null,
    Object? obligationIds = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as ProofMediaType,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      isMocked: null == isMocked
          ? _value.isMocked
          : isMocked // ignore: cast_nullable_to_non_nullable
              as bool,
      capturedAt: null == capturedAt
          ? _value.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      obligationIds: null == obligationIds
          ? _value.obligationIds
          : obligationIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionProofImplCopyWith<$Res>
    implements $TransactionProofCopyWith<$Res> {
  factory _$$TransactionProofImplCopyWith(_$TransactionProofImpl value,
          $Res Function(_$TransactionProofImpl) then) =
      __$$TransactionProofImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int userId,
      ProofMediaType mediaType,
      String url,
      double latitude,
      double longitude,
      double? accuracy,
      bool isMocked,
      DateTime capturedAt,
      List<int> obligationIds});
}

/// @nodoc
class __$$TransactionProofImplCopyWithImpl<$Res>
    extends _$TransactionProofCopyWithImpl<$Res, _$TransactionProofImpl>
    implements _$$TransactionProofImplCopyWith<$Res> {
  __$$TransactionProofImplCopyWithImpl(_$TransactionProofImpl _value,
      $Res Function(_$TransactionProofImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionProof
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? mediaType = null,
    Object? url = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracy = freezed,
    Object? isMocked = null,
    Object? capturedAt = null,
    Object? obligationIds = null,
  }) {
    return _then(_$TransactionProofImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as ProofMediaType,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      isMocked: null == isMocked
          ? _value.isMocked
          : isMocked // ignore: cast_nullable_to_non_nullable
              as bool,
      capturedAt: null == capturedAt
          ? _value.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      obligationIds: null == obligationIds
          ? _value._obligationIds
          : obligationIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionProofImpl extends _TransactionProof {
  const _$TransactionProofImpl(
      {this.id,
      required this.userId,
      required this.mediaType,
      required this.url,
      required this.latitude,
      required this.longitude,
      this.accuracy,
      this.isMocked = false,
      required this.capturedAt,
      final List<int> obligationIds = const []})
      : _obligationIds = obligationIds,
        super._();

  factory _$TransactionProofImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionProofImplFromJson(json);

  @override
  final int? id;
  @override
  final int userId;
  @override
  final ProofMediaType mediaType;
  @override
  final String url;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double? accuracy;
  @override
  @JsonKey()
  final bool isMocked;
  @override
  final DateTime capturedAt;
  final List<int> _obligationIds;
  @override
  @JsonKey()
  List<int> get obligationIds {
    if (_obligationIds is EqualUnmodifiableListView) return _obligationIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_obligationIds);
  }

  @override
  String toString() {
    return 'TransactionProof(id: $id, userId: $userId, mediaType: $mediaType, url: $url, latitude: $latitude, longitude: $longitude, accuracy: $accuracy, isMocked: $isMocked, capturedAt: $capturedAt, obligationIds: $obligationIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionProofImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.isMocked, isMocked) ||
                other.isMocked == isMocked) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt) &&
            const DeepCollectionEquality()
                .equals(other._obligationIds, _obligationIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      mediaType,
      url,
      latitude,
      longitude,
      accuracy,
      isMocked,
      capturedAt,
      const DeepCollectionEquality().hash(_obligationIds));

  /// Create a copy of TransactionProof
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionProofImplCopyWith<_$TransactionProofImpl> get copyWith =>
      __$$TransactionProofImplCopyWithImpl<_$TransactionProofImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionProofImplToJson(
      this,
    );
  }
}

abstract class _TransactionProof extends TransactionProof {
  const factory _TransactionProof(
      {final int? id,
      required final int userId,
      required final ProofMediaType mediaType,
      required final String url,
      required final double latitude,
      required final double longitude,
      final double? accuracy,
      final bool isMocked,
      required final DateTime capturedAt,
      final List<int> obligationIds}) = _$TransactionProofImpl;
  const _TransactionProof._() : super._();

  factory _TransactionProof.fromJson(Map<String, dynamic> json) =
      _$TransactionProofImpl.fromJson;

  @override
  int? get id;
  @override
  int get userId;
  @override
  ProofMediaType get mediaType;
  @override
  String get url;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double? get accuracy;
  @override
  bool get isMocked;
  @override
  DateTime get capturedAt;
  @override
  List<int> get obligationIds;

  /// Create a copy of TransactionProof
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionProofImplCopyWith<_$TransactionProofImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Mediation _$MediationFromJson(Map<String, dynamic> json) {
  return _Mediation.fromJson(json);
}

/// @nodoc
mixin _$Mediation {
  int? get id => throw _privateConstructorUsedError;
  int get user_id => throw _privateConstructorUsedError;
  int get binding => throw _privateConstructorUsedError;
  int get mediator => throw _privateConstructorUsedError;
  String get source_type => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  String? get web => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  /// Serializes this Mediation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Mediation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediationCopyWith<Mediation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediationCopyWith<$Res> {
  factory $MediationCopyWith(Mediation value, $Res Function(Mediation) then) =
      _$MediationCopyWithImpl<$Res, Mediation>;
  @useResult
  $Res call(
      {int? id,
      int user_id,
      int binding,
      int mediator,
      String source_type,
      String details,
      String? web,
      String? video,
      String? image});
}

/// @nodoc
class _$MediationCopyWithImpl<$Res, $Val extends Mediation>
    implements $MediationCopyWith<$Res> {
  _$MediationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Mediation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user_id = null,
    Object? binding = null,
    Object? mediator = null,
    Object? source_type = null,
    Object? details = null,
    Object? web = freezed,
    Object? video = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      binding: null == binding
          ? _value.binding
          : binding // ignore: cast_nullable_to_non_nullable
              as int,
      mediator: null == mediator
          ? _value.mediator
          : mediator // ignore: cast_nullable_to_non_nullable
              as int,
      source_type: null == source_type
          ? _value.source_type
          : source_type // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediationImplCopyWith<$Res>
    implements $MediationCopyWith<$Res> {
  factory _$$MediationImplCopyWith(
          _$MediationImpl value, $Res Function(_$MediationImpl) then) =
      __$$MediationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int user_id,
      int binding,
      int mediator,
      String source_type,
      String details,
      String? web,
      String? video,
      String? image});
}

/// @nodoc
class __$$MediationImplCopyWithImpl<$Res>
    extends _$MediationCopyWithImpl<$Res, _$MediationImpl>
    implements _$$MediationImplCopyWith<$Res> {
  __$$MediationImplCopyWithImpl(
      _$MediationImpl _value, $Res Function(_$MediationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Mediation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user_id = null,
    Object? binding = null,
    Object? mediator = null,
    Object? source_type = null,
    Object? details = null,
    Object? web = freezed,
    Object? video = freezed,
    Object? image = freezed,
  }) {
    return _then(_$MediationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      binding: null == binding
          ? _value.binding
          : binding // ignore: cast_nullable_to_non_nullable
              as int,
      mediator: null == mediator
          ? _value.mediator
          : mediator // ignore: cast_nullable_to_non_nullable
              as int,
      source_type: null == source_type
          ? _value.source_type
          : source_type // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      web: freezed == web
          ? _value.web
          : web // ignore: cast_nullable_to_non_nullable
              as String?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediationImpl extends _Mediation {
  const _$MediationImpl(
      {this.id,
      required this.user_id,
      required this.binding,
      required this.mediator,
      required this.source_type,
      required this.details,
      this.web,
      this.video,
      this.image})
      : super._();

  factory _$MediationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediationImplFromJson(json);

  @override
  final int? id;
  @override
  final int user_id;
  @override
  final int binding;
  @override
  final int mediator;
  @override
  final String source_type;
  @override
  final String details;
  @override
  final String? web;
  @override
  final String? video;
  @override
  final String? image;

  @override
  String toString() {
    return 'Mediation(id: $id, user_id: $user_id, binding: $binding, mediator: $mediator, source_type: $source_type, details: $details, web: $web, video: $video, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.binding, binding) || other.binding == binding) &&
            (identical(other.mediator, mediator) ||
                other.mediator == mediator) &&
            (identical(other.source_type, source_type) ||
                other.source_type == source_type) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.web, web) || other.web == web) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user_id, binding, mediator,
      source_type, details, web, video, image);

  /// Create a copy of Mediation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediationImplCopyWith<_$MediationImpl> get copyWith =>
      __$$MediationImplCopyWithImpl<_$MediationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediationImplToJson(
      this,
    );
  }
}

abstract class _Mediation extends Mediation {
  const factory _Mediation(
      {final int? id,
      required final int user_id,
      required final int binding,
      required final int mediator,
      required final String source_type,
      required final String details,
      final String? web,
      final String? video,
      final String? image}) = _$MediationImpl;
  const _Mediation._() : super._();

  factory _Mediation.fromJson(Map<String, dynamic> json) =
      _$MediationImpl.fromJson;

  @override
  int? get id;
  @override
  int get user_id;
  @override
  int get binding;
  @override
  int get mediator;
  @override
  String get source_type;
  @override
  String get details;
  @override
  String? get web;
  @override
  String? get video;
  @override
  String? get image;

  /// Create a copy of Mediation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediationImplCopyWith<_$MediationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get dateCreated => throw _privateConstructorUsedError;
  DateTime get expiryDate => throw _privateConstructorUsedError;
  double get percentageComplete => throw _privateConstructorUsedError;
  TransactionStatus get status => throw _privateConstructorUsedError;
  List<Obligation> get obligations => throw _privateConstructorUsedError;
  List<User> get members => throw _privateConstructorUsedError;
  List<String>? get notes => throw _privateConstructorUsedError;
  Mediation? get mediation => throw _privateConstructorUsedError;
  User? get payee => throw _privateConstructorUsedError;
  int? get conversationId =>
      throw _privateConstructorUsedError; // Read-only: proofs are uploaded through their own endpoint, so they
// are never sent back when the transaction is updated.
  @JsonKey(includeToJson: false)
  List<TransactionProof> get proofs => throw _privateConstructorUsedError;

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {int? id,
      int? userId,
      String title,
      TransactionType type,
      double total,
      String currency,
      DateTime dateCreated,
      DateTime expiryDate,
      double percentageComplete,
      TransactionStatus status,
      List<Obligation> obligations,
      List<User> members,
      List<String>? notes,
      Mediation? mediation,
      User? payee,
      int? conversationId,
      @JsonKey(includeToJson: false) List<TransactionProof> proofs});

  $MediationCopyWith<$Res>? get mediation;
  $UserCopyWith<$Res>? get payee;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = null,
    Object? type = null,
    Object? total = null,
    Object? currency = null,
    Object? dateCreated = null,
    Object? expiryDate = null,
    Object? percentageComplete = null,
    Object? status = null,
    Object? obligations = null,
    Object? members = null,
    Object? notes = freezed,
    Object? mediation = freezed,
    Object? payee = freezed,
    Object? conversationId = freezed,
    Object? proofs = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      percentageComplete: null == percentageComplete
          ? _value.percentageComplete
          : percentageComplete // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
      obligations: null == obligations
          ? _value.obligations
          : obligations // ignore: cast_nullable_to_non_nullable
              as List<Obligation>,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<User>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      mediation: freezed == mediation
          ? _value.mediation
          : mediation // ignore: cast_nullable_to_non_nullable
              as Mediation?,
      payee: freezed == payee
          ? _value.payee
          : payee // ignore: cast_nullable_to_non_nullable
              as User?,
      conversationId: freezed == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int?,
      proofs: null == proofs
          ? _value.proofs
          : proofs // ignore: cast_nullable_to_non_nullable
              as List<TransactionProof>,
    ) as $Val);
  }

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MediationCopyWith<$Res>? get mediation {
    if (_value.mediation == null) {
      return null;
    }

    return $MediationCopyWith<$Res>(_value.mediation!, (value) {
      return _then(_value.copyWith(mediation: value) as $Val);
    });
  }

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get payee {
    if (_value.payee == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.payee!, (value) {
      return _then(_value.copyWith(payee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? userId,
      String title,
      TransactionType type,
      double total,
      String currency,
      DateTime dateCreated,
      DateTime expiryDate,
      double percentageComplete,
      TransactionStatus status,
      List<Obligation> obligations,
      List<User> members,
      List<String>? notes,
      Mediation? mediation,
      User? payee,
      int? conversationId,
      @JsonKey(includeToJson: false) List<TransactionProof> proofs});

  @override
  $MediationCopyWith<$Res>? get mediation;
  @override
  $UserCopyWith<$Res>? get payee;
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = null,
    Object? type = null,
    Object? total = null,
    Object? currency = null,
    Object? dateCreated = null,
    Object? expiryDate = null,
    Object? percentageComplete = null,
    Object? status = null,
    Object? obligations = null,
    Object? members = null,
    Object? notes = freezed,
    Object? mediation = freezed,
    Object? payee = freezed,
    Object? conversationId = freezed,
    Object? proofs = null,
  }) {
    return _then(_$TransactionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: null == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      percentageComplete: null == percentageComplete
          ? _value.percentageComplete
          : percentageComplete // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
      obligations: null == obligations
          ? _value._obligations
          : obligations // ignore: cast_nullable_to_non_nullable
              as List<Obligation>,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<User>,
      notes: freezed == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      mediation: freezed == mediation
          ? _value.mediation
          : mediation // ignore: cast_nullable_to_non_nullable
              as Mediation?,
      payee: freezed == payee
          ? _value.payee
          : payee // ignore: cast_nullable_to_non_nullable
              as User?,
      conversationId: freezed == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int?,
      proofs: null == proofs
          ? _value._proofs
          : proofs // ignore: cast_nullable_to_non_nullable
              as List<TransactionProof>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl extends _Transaction {
  const _$TransactionImpl(
      {this.id,
      this.userId,
      required this.title,
      required this.type,
      required this.total,
      this.currency = 'NGN',
      required this.dateCreated,
      required this.expiryDate,
      required this.percentageComplete,
      required this.status,
      required final List<Obligation> obligations,
      required final List<User> members,
      final List<String>? notes,
      this.mediation,
      this.payee,
      this.conversationId,
      @JsonKey(includeToJson: false)
      final List<TransactionProof> proofs = const []})
      : _obligations = obligations,
        _members = members,
        _notes = notes,
        _proofs = proofs,
        super._();

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final int? id;
  @override
  final int? userId;
  @override
  final String title;
  @override
  final TransactionType type;
  @override
  final double total;
  @override
  @JsonKey()
  final String currency;
  @override
  final DateTime dateCreated;
  @override
  final DateTime expiryDate;
  @override
  final double percentageComplete;
  @override
  final TransactionStatus status;
  final List<Obligation> _obligations;
  @override
  List<Obligation> get obligations {
    if (_obligations is EqualUnmodifiableListView) return _obligations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_obligations);
  }

  final List<User> _members;
  @override
  List<User> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<String>? _notes;
  @override
  List<String>? get notes {
    final value = _notes;
    if (value == null) return null;
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Mediation? mediation;
  @override
  final User? payee;
  @override
  final int? conversationId;
// Read-only: proofs are uploaded through their own endpoint, so they
// are never sent back when the transaction is updated.
  final List<TransactionProof> _proofs;
// Read-only: proofs are uploaded through their own endpoint, so they
// are never sent back when the transaction is updated.
  @override
  @JsonKey(includeToJson: false)
  List<TransactionProof> get proofs {
    if (_proofs is EqualUnmodifiableListView) return _proofs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_proofs);
  }

  @override
  String toString() {
    return 'Transaction(id: $id, userId: $userId, title: $title, type: $type, total: $total, currency: $currency, dateCreated: $dateCreated, expiryDate: $expiryDate, percentageComplete: $percentageComplete, status: $status, obligations: $obligations, members: $members, notes: $notes, mediation: $mediation, payee: $payee, conversationId: $conversationId, proofs: $proofs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.percentageComplete, percentageComplete) ||
                other.percentageComplete == percentageComplete) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._obligations, _obligations) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.mediation, mediation) ||
                other.mediation == mediation) &&
            (identical(other.payee, payee) || other.payee == payee) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            const DeepCollectionEquality().equals(other._proofs, _proofs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      type,
      total,
      currency,
      dateCreated,
      expiryDate,
      percentageComplete,
      status,
      const DeepCollectionEquality().hash(_obligations),
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_notes),
      mediation,
      payee,
      conversationId,
      const DeepCollectionEquality().hash(_proofs));

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction extends Transaction {
  const factory _Transaction(
          {final int? id,
          final int? userId,
          required final String title,
          required final TransactionType type,
          required final double total,
          final String currency,
          required final DateTime dateCreated,
          required final DateTime expiryDate,
          required final double percentageComplete,
          required final TransactionStatus status,
          required final List<Obligation> obligations,
          required final List<User> members,
          final List<String>? notes,
          final Mediation? mediation,
          final User? payee,
          final int? conversationId,
          @JsonKey(includeToJson: false) final List<TransactionProof> proofs}) =
      _$TransactionImpl;
  const _Transaction._() : super._();

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  int? get id;
  @override
  int? get userId;
  @override
  String get title;
  @override
  TransactionType get type;
  @override
  double get total;
  @override
  String get currency;
  @override
  DateTime get dateCreated;
  @override
  DateTime get expiryDate;
  @override
  double get percentageComplete;
  @override
  TransactionStatus get status;
  @override
  List<Obligation> get obligations;
  @override
  List<User> get members;
  @override
  List<String>? get notes;
  @override
  Mediation? get mediation;
  @override
  User? get payee;
  @override
  int?
      get conversationId; // Read-only: proofs are uploaded through their own endpoint, so they
// are never sent back when the transaction is updated.
  @override
  @JsonKey(includeToJson: false)
  List<TransactionProof> get proofs;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  int? get id => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  Transaction? get transaction => throw _privateConstructorUsedError;
  int? get conversationId => throw _privateConstructorUsedError;
  NotificationKind get kind => throw _privateConstructorUsedError;
  NotificationState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {int? id,
      User user,
      Transaction? transaction,
      int? conversationId,
      NotificationKind kind,
      NotificationState state,
      String message,
      DateTime date});

  $UserCopyWith<$Res> get user;
  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = null,
    Object? transaction = freezed,
    Object? conversationId = freezed,
    Object? kind = null,
    Object? state = null,
    Object? message = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      conversationId: freezed == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int?,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as NotificationKind,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as NotificationState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of Notification
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
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      User user,
      Transaction? transaction,
      int? conversationId,
      NotificationKind kind,
      NotificationState state,
      String message,
      DateTime date});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $TransactionCopyWith<$Res>? get transaction;
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = null,
    Object? transaction = freezed,
    Object? conversationId = freezed,
    Object? kind = null,
    Object? state = null,
    Object? message = null,
    Object? date = null,
  }) {
    return _then(_$NotificationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction?,
      conversationId: freezed == conversationId
          ? _value.conversationId
          : conversationId // ignore: cast_nullable_to_non_nullable
              as int?,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as NotificationKind,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as NotificationState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl extends _Notification {
  const _$NotificationImpl(
      {this.id,
      required this.user,
      this.transaction,
      this.conversationId,
      this.kind = NotificationKind.transaction,
      required this.state,
      required this.message,
      required this.date})
      : super._();

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  final int? id;
  @override
  final User user;
  @override
  final Transaction? transaction;
  @override
  final int? conversationId;
  @override
  @JsonKey()
  final NotificationKind kind;
  @override
  final NotificationState state;
  @override
  final String message;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'Notification(id: $id, user: $user, transaction: $transaction, conversationId: $conversationId, kind: $kind, state: $state, message: $message, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, transaction,
      conversationId, kind, state, message, date);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification extends Notification {
  const factory _Notification(
      {final int? id,
      required final User user,
      final Transaction? transaction,
      final int? conversationId,
      final NotificationKind kind,
      required final NotificationState state,
      required final String message,
      required final DateTime date}) = _$NotificationImpl;
  const _Notification._() : super._();

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  int? get id;
  @override
  User get user;
  @override
  Transaction? get transaction;
  @override
  int? get conversationId;
  @override
  NotificationKind get kind;
  @override
  NotificationState get state;
  @override
  String get message;
  @override
  DateTime get date;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
