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

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int? get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get profileImage => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  String get fcmToken => throw _privateConstructorUsedError;
  String get bvn => throw _privateConstructorUsedError;
  String? get businessName => throw _privateConstructorUsedError;
  UserStatistics? get userStatistics => throw _privateConstructorUsedError;
  TransactionStatistics? get transactionStatistics =>
      throw _privateConstructorUsedError;
  bool get admin => throw _privateConstructorUsedError;
  bool get mediator => throw _privateConstructorUsedError;
  bool get online => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int? id,
      String firstName,
      String lastName,
      String profileImage,
      String email,
      Account? account,
      String fcmToken,
      String bvn,
      String? businessName,
      UserStatistics? userStatistics,
      TransactionStatistics? transactionStatistics,
      bool admin,
      bool mediator,
      bool online});

  $AccountCopyWith<$Res>? get account;
  $UserStatisticsCopyWith<$Res>? get userStatistics;
  $TransactionStatisticsCopyWith<$Res>? get transactionStatistics;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? profileImage = null,
    Object? email = null,
    Object? account = freezed,
    Object? fcmToken = null,
    Object? bvn = null,
    Object? businessName = freezed,
    Object? userStatistics = freezed,
    Object? transactionStatistics = freezed,
    Object? admin = null,
    Object? mediator = null,
    Object? online = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      bvn: null == bvn
          ? _value.bvn
          : bvn // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: freezed == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      userStatistics: freezed == userStatistics
          ? _value.userStatistics
          : userStatistics // ignore: cast_nullable_to_non_nullable
              as UserStatistics?,
      transactionStatistics: freezed == transactionStatistics
          ? _value.transactionStatistics
          : transactionStatistics // ignore: cast_nullable_to_non_nullable
              as TransactionStatistics?,
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as bool,
      mediator: null == mediator
          ? _value.mediator
          : mediator // ignore: cast_nullable_to_non_nullable
              as bool,
      online: null == online
          ? _value.online
          : online // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStatisticsCopyWith<$Res>? get userStatistics {
    if (_value.userStatistics == null) {
      return null;
    }

    return $UserStatisticsCopyWith<$Res>(_value.userStatistics!, (value) {
      return _then(_value.copyWith(userStatistics: value) as $Val);
    });
  }

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionStatisticsCopyWith<$Res>? get transactionStatistics {
    if (_value.transactionStatistics == null) {
      return null;
    }

    return $TransactionStatisticsCopyWith<$Res>(_value.transactionStatistics!,
        (value) {
      return _then(_value.copyWith(transactionStatistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String firstName,
      String lastName,
      String profileImage,
      String email,
      Account? account,
      String fcmToken,
      String bvn,
      String? businessName,
      UserStatistics? userStatistics,
      TransactionStatistics? transactionStatistics,
      bool admin,
      bool mediator,
      bool online});

  @override
  $AccountCopyWith<$Res>? get account;
  @override
  $UserStatisticsCopyWith<$Res>? get userStatistics;
  @override
  $TransactionStatisticsCopyWith<$Res>? get transactionStatistics;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? profileImage = null,
    Object? email = null,
    Object? account = freezed,
    Object? fcmToken = null,
    Object? bvn = null,
    Object? businessName = freezed,
    Object? userStatistics = freezed,
    Object? transactionStatistics = freezed,
    Object? admin = null,
    Object? mediator = null,
    Object? online = null,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      bvn: null == bvn
          ? _value.bvn
          : bvn // ignore: cast_nullable_to_non_nullable
              as String,
      businessName: freezed == businessName
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      userStatistics: freezed == userStatistics
          ? _value.userStatistics
          : userStatistics // ignore: cast_nullable_to_non_nullable
              as UserStatistics?,
      transactionStatistics: freezed == transactionStatistics
          ? _value.transactionStatistics
          : transactionStatistics // ignore: cast_nullable_to_non_nullable
              as TransactionStatistics?,
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as bool,
      mediator: null == mediator
          ? _value.mediator
          : mediator // ignore: cast_nullable_to_non_nullable
              as bool,
      online: null == online
          ? _value.online
          : online // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends _User {
  const _$UserImpl(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.profileImage,
      required this.email,
      this.account,
      required this.fcmToken,
      required this.bvn,
      this.businessName,
      this.userStatistics,
      this.transactionStatistics,
      this.admin = false,
      this.mediator = false,
      this.online = false})
      : super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int? id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String profileImage;
  @override
  final String email;
  @override
  final Account? account;
  @override
  final String fcmToken;
  @override
  final String bvn;
  @override
  final String? businessName;
  @override
  final UserStatistics? userStatistics;
  @override
  final TransactionStatistics? transactionStatistics;
  @override
  @JsonKey()
  final bool admin;
  @override
  @JsonKey()
  final bool mediator;
  @override
  @JsonKey()
  final bool online;

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, profileImage: $profileImage, email: $email, account: $account, fcmToken: $fcmToken, bvn: $bvn, businessName: $businessName, userStatistics: $userStatistics, transactionStatistics: $transactionStatistics, admin: $admin, mediator: $mediator, online: $online)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.bvn, bvn) || other.bvn == bvn) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.userStatistics, userStatistics) ||
                other.userStatistics == userStatistics) &&
            (identical(other.transactionStatistics, transactionStatistics) ||
                other.transactionStatistics == transactionStatistics) &&
            (identical(other.admin, admin) || other.admin == admin) &&
            (identical(other.mediator, mediator) ||
                other.mediator == mediator) &&
            (identical(other.online, online) || other.online == online));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      profileImage,
      email,
      account,
      fcmToken,
      bvn,
      businessName,
      userStatistics,
      transactionStatistics,
      admin,
      mediator,
      online);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {final int? id,
      required final String firstName,
      required final String lastName,
      required final String profileImage,
      required final String email,
      final Account? account,
      required final String fcmToken,
      required final String bvn,
      final String? businessName,
      final UserStatistics? userStatistics,
      final TransactionStatistics? transactionStatistics,
      final bool admin,
      final bool mediator,
      final bool online}) = _$UserImpl;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int? get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get profileImage;
  @override
  String get email;
  @override
  Account? get account;
  @override
  String get fcmToken;
  @override
  String get bvn;
  @override
  String? get businessName;
  @override
  UserStatistics? get userStatistics;
  @override
  TransactionStatistics? get transactionStatistics;
  @override
  bool get admin;
  @override
  bool get mediator;
  @override
  bool get online;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionStatistics _$TransactionStatisticsFromJson(
    Map<String, dynamic> json) {
  return _TransactionStatistics.fromJson(json);
}

/// @nodoc
mixin _$TransactionStatistics {
  List<int> get secureSales => throw _privateConstructorUsedError;
  List<int> get billSplitter => throw _privateConstructorUsedError;
  List<int> get betsAndWager => throw _privateConstructorUsedError;
  List<int> get moneyPool => throw _privateConstructorUsedError;
  List<int> get groupGoals => throw _privateConstructorUsedError;

  /// Serializes this TransactionStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionStatisticsCopyWith<TransactionStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStatisticsCopyWith<$Res> {
  factory $TransactionStatisticsCopyWith(TransactionStatistics value,
          $Res Function(TransactionStatistics) then) =
      _$TransactionStatisticsCopyWithImpl<$Res, TransactionStatistics>;
  @useResult
  $Res call(
      {List<int> secureSales,
      List<int> billSplitter,
      List<int> betsAndWager,
      List<int> moneyPool,
      List<int> groupGoals});
}

/// @nodoc
class _$TransactionStatisticsCopyWithImpl<$Res,
        $Val extends TransactionStatistics>
    implements $TransactionStatisticsCopyWith<$Res> {
  _$TransactionStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secureSales = null,
    Object? billSplitter = null,
    Object? betsAndWager = null,
    Object? moneyPool = null,
    Object? groupGoals = null,
  }) {
    return _then(_value.copyWith(
      secureSales: null == secureSales
          ? _value.secureSales
          : secureSales // ignore: cast_nullable_to_non_nullable
              as List<int>,
      billSplitter: null == billSplitter
          ? _value.billSplitter
          : billSplitter // ignore: cast_nullable_to_non_nullable
              as List<int>,
      betsAndWager: null == betsAndWager
          ? _value.betsAndWager
          : betsAndWager // ignore: cast_nullable_to_non_nullable
              as List<int>,
      moneyPool: null == moneyPool
          ? _value.moneyPool
          : moneyPool // ignore: cast_nullable_to_non_nullable
              as List<int>,
      groupGoals: null == groupGoals
          ? _value.groupGoals
          : groupGoals // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionStatisticsImplCopyWith<$Res>
    implements $TransactionStatisticsCopyWith<$Res> {
  factory _$$TransactionStatisticsImplCopyWith(
          _$TransactionStatisticsImpl value,
          $Res Function(_$TransactionStatisticsImpl) then) =
      __$$TransactionStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<int> secureSales,
      List<int> billSplitter,
      List<int> betsAndWager,
      List<int> moneyPool,
      List<int> groupGoals});
}

/// @nodoc
class __$$TransactionStatisticsImplCopyWithImpl<$Res>
    extends _$TransactionStatisticsCopyWithImpl<$Res,
        _$TransactionStatisticsImpl>
    implements _$$TransactionStatisticsImplCopyWith<$Res> {
  __$$TransactionStatisticsImplCopyWithImpl(_$TransactionStatisticsImpl _value,
      $Res Function(_$TransactionStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secureSales = null,
    Object? billSplitter = null,
    Object? betsAndWager = null,
    Object? moneyPool = null,
    Object? groupGoals = null,
  }) {
    return _then(_$TransactionStatisticsImpl(
      secureSales: null == secureSales
          ? _value._secureSales
          : secureSales // ignore: cast_nullable_to_non_nullable
              as List<int>,
      billSplitter: null == billSplitter
          ? _value._billSplitter
          : billSplitter // ignore: cast_nullable_to_non_nullable
              as List<int>,
      betsAndWager: null == betsAndWager
          ? _value._betsAndWager
          : betsAndWager // ignore: cast_nullable_to_non_nullable
              as List<int>,
      moneyPool: null == moneyPool
          ? _value._moneyPool
          : moneyPool // ignore: cast_nullable_to_non_nullable
              as List<int>,
      groupGoals: null == groupGoals
          ? _value._groupGoals
          : groupGoals // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionStatisticsImpl implements _TransactionStatistics {
  const _$TransactionStatisticsImpl(
      {final List<int> secureSales = const [0, 0, 0],
      final List<int> billSplitter = const [0, 0, 0],
      final List<int> betsAndWager = const [0, 0, 0],
      final List<int> moneyPool = const [0, 0, 0],
      final List<int> groupGoals = const [0, 0, 0]})
      : _secureSales = secureSales,
        _billSplitter = billSplitter,
        _betsAndWager = betsAndWager,
        _moneyPool = moneyPool,
        _groupGoals = groupGoals;

  factory _$TransactionStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionStatisticsImplFromJson(json);

  final List<int> _secureSales;
  @override
  @JsonKey()
  List<int> get secureSales {
    if (_secureSales is EqualUnmodifiableListView) return _secureSales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secureSales);
  }

  final List<int> _billSplitter;
  @override
  @JsonKey()
  List<int> get billSplitter {
    if (_billSplitter is EqualUnmodifiableListView) return _billSplitter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_billSplitter);
  }

  final List<int> _betsAndWager;
  @override
  @JsonKey()
  List<int> get betsAndWager {
    if (_betsAndWager is EqualUnmodifiableListView) return _betsAndWager;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_betsAndWager);
  }

  final List<int> _moneyPool;
  @override
  @JsonKey()
  List<int> get moneyPool {
    if (_moneyPool is EqualUnmodifiableListView) return _moneyPool;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moneyPool);
  }

  final List<int> _groupGoals;
  @override
  @JsonKey()
  List<int> get groupGoals {
    if (_groupGoals is EqualUnmodifiableListView) return _groupGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupGoals);
  }

  @override
  String toString() {
    return 'TransactionStatistics(secureSales: $secureSales, billSplitter: $billSplitter, betsAndWager: $betsAndWager, moneyPool: $moneyPool, groupGoals: $groupGoals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionStatisticsImpl &&
            const DeepCollectionEquality()
                .equals(other._secureSales, _secureSales) &&
            const DeepCollectionEquality()
                .equals(other._billSplitter, _billSplitter) &&
            const DeepCollectionEquality()
                .equals(other._betsAndWager, _betsAndWager) &&
            const DeepCollectionEquality()
                .equals(other._moneyPool, _moneyPool) &&
            const DeepCollectionEquality()
                .equals(other._groupGoals, _groupGoals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_secureSales),
      const DeepCollectionEquality().hash(_billSplitter),
      const DeepCollectionEquality().hash(_betsAndWager),
      const DeepCollectionEquality().hash(_moneyPool),
      const DeepCollectionEquality().hash(_groupGoals));

  /// Create a copy of TransactionStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionStatisticsImplCopyWith<_$TransactionStatisticsImpl>
      get copyWith => __$$TransactionStatisticsImplCopyWithImpl<
          _$TransactionStatisticsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionStatisticsImplToJson(
      this,
    );
  }
}

abstract class _TransactionStatistics implements TransactionStatistics {
  const factory _TransactionStatistics(
      {final List<int> secureSales,
      final List<int> billSplitter,
      final List<int> betsAndWager,
      final List<int> moneyPool,
      final List<int> groupGoals}) = _$TransactionStatisticsImpl;

  factory _TransactionStatistics.fromJson(Map<String, dynamic> json) =
      _$TransactionStatisticsImpl.fromJson;

  @override
  List<int> get secureSales;
  @override
  List<int> get billSplitter;
  @override
  List<int> get betsAndWager;
  @override
  List<int> get moneyPool;
  @override
  List<int> get groupGoals;

  /// Create a copy of TransactionStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionStatisticsImplCopyWith<_$TransactionStatisticsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Authentication _$AuthenticationFromJson(Map<String, dynamic> json) {
  return _Authentication.fromJson(json);
}

/// @nodoc
mixin _$Authentication {
  String? get token => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  /// Serializes this Authentication to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Authentication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticationCopyWith<Authentication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationCopyWith<$Res> {
  factory $AuthenticationCopyWith(
          Authentication value, $Res Function(Authentication) then) =
      _$AuthenticationCopyWithImpl<$Res, Authentication>;
  @useResult
  $Res call({String? token, User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthenticationCopyWithImpl<$Res, $Val extends Authentication>
    implements $AuthenticationCopyWith<$Res> {
  _$AuthenticationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Authentication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  /// Create a copy of Authentication
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
}

/// @nodoc
abstract class _$$AuthenticationImplCopyWith<$Res>
    implements $AuthenticationCopyWith<$Res> {
  factory _$$AuthenticationImplCopyWith(_$AuthenticationImpl value,
          $Res Function(_$AuthenticationImpl) then) =
      __$$AuthenticationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token, User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthenticationImplCopyWithImpl<$Res>
    extends _$AuthenticationCopyWithImpl<$Res, _$AuthenticationImpl>
    implements _$$AuthenticationImplCopyWith<$Res> {
  __$$AuthenticationImplCopyWithImpl(
      _$AuthenticationImpl _value, $Res Function(_$AuthenticationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Authentication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? user = freezed,
  }) {
    return _then(_$AuthenticationImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationImpl implements _Authentication {
  const _$AuthenticationImpl({this.token, this.user});

  factory _$AuthenticationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticationImplFromJson(json);

  @override
  final String? token;
  @override
  final User? user;

  @override
  String toString() {
    return 'Authentication(token: $token, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, user);

  /// Create a copy of Authentication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationImplCopyWith<_$AuthenticationImpl> get copyWith =>
      __$$AuthenticationImplCopyWithImpl<_$AuthenticationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationImplToJson(
      this,
    );
  }
}

abstract class _Authentication implements Authentication {
  const factory _Authentication({final String? token, final User? user}) =
      _$AuthenticationImpl;

  factory _Authentication.fromJson(Map<String, dynamic> json) =
      _$AuthenticationImpl.fromJson;

  @override
  String? get token;
  @override
  User? get user;

  /// Create a copy of Authentication
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationImplCopyWith<_$AuthenticationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserStatistics _$UserStatisticsFromJson(Map<String, dynamic> json) {
  return _UserStatistics.fromJson(json);
}

/// @nodoc
mixin _$UserStatistics {
  int get allTransactions => throw _privateConstructorUsedError;
  int get created => throw _privateConstructorUsedError;
  int get completed => throw _privateConstructorUsedError;
  int get pending => throw _privateConstructorUsedError;
  int get verification => throw _privateConstructorUsedError;
  int get declined => throw _privateConstructorUsedError;
  int get accepted => throw _privateConstructorUsedError;

  /// Serializes this UserStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatisticsCopyWith<UserStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatisticsCopyWith<$Res> {
  factory $UserStatisticsCopyWith(
          UserStatistics value, $Res Function(UserStatistics) then) =
      _$UserStatisticsCopyWithImpl<$Res, UserStatistics>;
  @useResult
  $Res call(
      {int allTransactions,
      int created,
      int completed,
      int pending,
      int verification,
      int declined,
      int accepted});
}

/// @nodoc
class _$UserStatisticsCopyWithImpl<$Res, $Val extends UserStatistics>
    implements $UserStatisticsCopyWith<$Res> {
  _$UserStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTransactions = null,
    Object? created = null,
    Object? completed = null,
    Object? pending = null,
    Object? verification = null,
    Object? declined = null,
    Object? accepted = null,
  }) {
    return _then(_value.copyWith(
      allTransactions: null == allTransactions
          ? _value.allTransactions
          : allTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int,
      pending: null == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as int,
      verification: null == verification
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as int,
      declined: null == declined
          ? _value.declined
          : declined // ignore: cast_nullable_to_non_nullable
              as int,
      accepted: null == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatisticsImplCopyWith<$Res>
    implements $UserStatisticsCopyWith<$Res> {
  factory _$$UserStatisticsImplCopyWith(_$UserStatisticsImpl value,
          $Res Function(_$UserStatisticsImpl) then) =
      __$$UserStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int allTransactions,
      int created,
      int completed,
      int pending,
      int verification,
      int declined,
      int accepted});
}

/// @nodoc
class __$$UserStatisticsImplCopyWithImpl<$Res>
    extends _$UserStatisticsCopyWithImpl<$Res, _$UserStatisticsImpl>
    implements _$$UserStatisticsImplCopyWith<$Res> {
  __$$UserStatisticsImplCopyWithImpl(
      _$UserStatisticsImpl _value, $Res Function(_$UserStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTransactions = null,
    Object? created = null,
    Object? completed = null,
    Object? pending = null,
    Object? verification = null,
    Object? declined = null,
    Object? accepted = null,
  }) {
    return _then(_$UserStatisticsImpl(
      allTransactions: null == allTransactions
          ? _value.allTransactions
          : allTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int,
      pending: null == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as int,
      verification: null == verification
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as int,
      declined: null == declined
          ? _value.declined
          : declined // ignore: cast_nullable_to_non_nullable
              as int,
      accepted: null == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatisticsImpl implements _UserStatistics {
  const _$UserStatisticsImpl(
      {this.allTransactions = 0,
      this.created = 0,
      this.completed = 0,
      this.pending = 0,
      this.verification = 0,
      this.declined = 0,
      this.accepted = 0});

  factory _$UserStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatisticsImplFromJson(json);

  @override
  @JsonKey()
  final int allTransactions;
  @override
  @JsonKey()
  final int created;
  @override
  @JsonKey()
  final int completed;
  @override
  @JsonKey()
  final int pending;
  @override
  @JsonKey()
  final int verification;
  @override
  @JsonKey()
  final int declined;
  @override
  @JsonKey()
  final int accepted;

  @override
  String toString() {
    return 'UserStatistics(allTransactions: $allTransactions, created: $created, completed: $completed, pending: $pending, verification: $verification, declined: $declined, accepted: $accepted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatisticsImpl &&
            (identical(other.allTransactions, allTransactions) ||
                other.allTransactions == allTransactions) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.verification, verification) ||
                other.verification == verification) &&
            (identical(other.declined, declined) ||
                other.declined == declined) &&
            (identical(other.accepted, accepted) ||
                other.accepted == accepted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, allTransactions, created,
      completed, pending, verification, declined, accepted);

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatisticsImplCopyWith<_$UserStatisticsImpl> get copyWith =>
      __$$UserStatisticsImplCopyWithImpl<_$UserStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatisticsImplToJson(
      this,
    );
  }
}

abstract class _UserStatistics implements UserStatistics {
  const factory _UserStatistics(
      {final int allTransactions,
      final int created,
      final int completed,
      final int pending,
      final int verification,
      final int declined,
      final int accepted}) = _$UserStatisticsImpl;

  factory _UserStatistics.fromJson(Map<String, dynamic> json) =
      _$UserStatisticsImpl.fromJson;

  @override
  int get allTransactions;
  @override
  int get created;
  @override
  int get completed;
  @override
  int get pending;
  @override
  int get verification;
  @override
  int get declined;
  @override
  int get accepted;

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatisticsImplCopyWith<_$UserStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  dynamic get name => throw _privateConstructorUsedError;
  dynamic get accountNumber => throw _privateConstructorUsedError;
  dynamic get balance => throw _privateConstructorUsedError;

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call({dynamic name, dynamic accountNumber, dynamic balance});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? accountNumber = freezed,
    Object? balance = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
          _$AccountImpl value, $Res Function(_$AccountImpl) then) =
      __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic name, dynamic accountNumber, dynamic balance});
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
      _$AccountImpl _value, $Res Function(_$AccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? accountNumber = freezed,
    Object? balance = freezed,
  }) {
    return _then(_$AccountImpl(
      name: freezed == name ? _value.name! : name,
      accountNumber:
          freezed == accountNumber ? _value.accountNumber! : accountNumber,
      balance: freezed == balance ? _value.balance! : balance,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl implements _Account {
  const _$AccountImpl(
      {this.name = 'no account',
      this.accountNumber = '102020020',
      this.balance = 0.0});

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  @JsonKey()
  final dynamic name;
  @override
  @JsonKey()
  final dynamic accountNumber;
  @override
  @JsonKey()
  final dynamic balance;

  @override
  String toString() {
    return 'Account(name: $name, accountNumber: $accountNumber, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.accountNumber, accountNumber) &&
            const DeepCollectionEquality().equals(other.balance, balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(accountNumber),
      const DeepCollectionEquality().hash(balance));

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  const factory _Account(
      {final dynamic name,
      final dynamic accountNumber,
      final dynamic balance}) = _$AccountImpl;

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  dynamic get name;
  @override
  dynamic get accountNumber;
  @override
  dynamic get balance;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
