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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) loadUser,
    required TResult Function() currentUser,
    required TResult Function(String searchText, int pageSize, int page)
        searchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? loadUser,
    TResult? Function()? currentUser,
    TResult? Function(String searchText, int pageSize, int page)? searchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? loadUser,
    TResult Function()? currentUser,
    TResult Function(String searchText, int pageSize, int page)? searchUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUser value) loadUser,
    required TResult Function(_CurrentUser value) currentUser,
    required TResult Function(_SearchUser value) searchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUser value)? loadUser,
    TResult? Function(_CurrentUser value)? currentUser,
    TResult? Function(_SearchUser value)? searchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUser value)? loadUser,
    TResult Function(_CurrentUser value)? currentUser,
    TResult Function(_SearchUser value)? searchUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
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
}

/// @nodoc
abstract class _$$LoadUserImplCopyWith<$Res> {
  factory _$$LoadUserImplCopyWith(
          _$LoadUserImpl value, $Res Function(_$LoadUserImpl) then) =
      __$$LoadUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
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
  }) {
    return _then(_$LoadUserImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadUserImpl implements _LoadUser {
  const _$LoadUserImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'UserEvent.loadUser(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUserImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

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
    required TResult Function(int id) loadUser,
    required TResult Function() currentUser,
    required TResult Function(String searchText, int pageSize, int page)
        searchUsers,
  }) {
    return loadUser(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? loadUser,
    TResult? Function()? currentUser,
    TResult? Function(String searchText, int pageSize, int page)? searchUsers,
  }) {
    return loadUser?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? loadUser,
    TResult Function()? currentUser,
    TResult Function(String searchText, int pageSize, int page)? searchUsers,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUser value) loadUser,
    required TResult Function(_CurrentUser value) currentUser,
    required TResult Function(_SearchUser value) searchUsers,
  }) {
    return loadUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUser value)? loadUser,
    TResult? Function(_CurrentUser value)? currentUser,
    TResult? Function(_SearchUser value)? searchUsers,
  }) {
    return loadUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUser value)? loadUser,
    TResult Function(_CurrentUser value)? currentUser,
    TResult Function(_SearchUser value)? searchUsers,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser(this);
    }
    return orElse();
  }
}

abstract class _LoadUser implements UserEvent {
  const factory _LoadUser(final int id) = _$LoadUserImpl;

  int get id;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadUserImplCopyWith<_$LoadUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CurrentUserImplCopyWith<$Res> {
  factory _$$CurrentUserImplCopyWith(
          _$CurrentUserImpl value, $Res Function(_$CurrentUserImpl) then) =
      __$$CurrentUserImplCopyWithImpl<$Res>;
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
}

/// @nodoc

class _$CurrentUserImpl implements _CurrentUser {
  const _$CurrentUserImpl();

  @override
  String toString() {
    return 'UserEvent.currentUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CurrentUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) loadUser,
    required TResult Function() currentUser,
    required TResult Function(String searchText, int pageSize, int page)
        searchUsers,
  }) {
    return currentUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? loadUser,
    TResult? Function()? currentUser,
    TResult? Function(String searchText, int pageSize, int page)? searchUsers,
  }) {
    return currentUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? loadUser,
    TResult Function()? currentUser,
    TResult Function(String searchText, int pageSize, int page)? searchUsers,
    required TResult orElse(),
  }) {
    if (currentUser != null) {
      return currentUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUser value) loadUser,
    required TResult Function(_CurrentUser value) currentUser,
    required TResult Function(_SearchUser value) searchUsers,
  }) {
    return currentUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUser value)? loadUser,
    TResult? Function(_CurrentUser value)? currentUser,
    TResult? Function(_SearchUser value)? searchUsers,
  }) {
    return currentUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUser value)? loadUser,
    TResult Function(_CurrentUser value)? currentUser,
    TResult Function(_SearchUser value)? searchUsers,
    required TResult orElse(),
  }) {
    if (currentUser != null) {
      return currentUser(this);
    }
    return orElse();
  }
}

abstract class _CurrentUser implements UserEvent {
  const factory _CurrentUser() = _$CurrentUserImpl;
}

/// @nodoc
abstract class _$$SearchUserImplCopyWith<$Res> {
  factory _$$SearchUserImplCopyWith(
          _$SearchUserImpl value, $Res Function(_$SearchUserImpl) then) =
      __$$SearchUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchText, int pageSize, int page});
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
    Object? searchText = null,
    Object? pageSize = null,
    Object? page = null,
  }) {
    return _then(_$SearchUserImpl(
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

class _$SearchUserImpl implements _SearchUser {
  const _$SearchUserImpl(this.searchText, this.pageSize, this.page);

  @override
  final String searchText;
  @override
  final int pageSize;
  @override
  final int page;

  @override
  String toString() {
    return 'UserEvent.searchUsers(searchText: $searchText, pageSize: $pageSize, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchText, pageSize, page);

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
    required TResult Function(int id) loadUser,
    required TResult Function() currentUser,
    required TResult Function(String searchText, int pageSize, int page)
        searchUsers,
  }) {
    return searchUsers(searchText, pageSize, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? loadUser,
    TResult? Function()? currentUser,
    TResult? Function(String searchText, int pageSize, int page)? searchUsers,
  }) {
    return searchUsers?.call(searchText, pageSize, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? loadUser,
    TResult Function()? currentUser,
    TResult Function(String searchText, int pageSize, int page)? searchUsers,
    required TResult orElse(),
  }) {
    if (searchUsers != null) {
      return searchUsers(searchText, pageSize, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUser value) loadUser,
    required TResult Function(_CurrentUser value) currentUser,
    required TResult Function(_SearchUser value) searchUsers,
  }) {
    return searchUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUser value)? loadUser,
    TResult? Function(_CurrentUser value)? currentUser,
    TResult? Function(_SearchUser value)? searchUsers,
  }) {
    return searchUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUser value)? loadUser,
    TResult Function(_CurrentUser value)? currentUser,
    TResult Function(_SearchUser value)? searchUsers,
    required TResult orElse(),
  }) {
    if (searchUsers != null) {
      return searchUsers(this);
    }
    return orElse();
  }
}

abstract class _SearchUser implements UserEvent {
  const factory _SearchUser(
          final String searchText, final int pageSize, final int page) =
      _$SearchUserImpl;

  String get searchText;
  int get pageSize;
  int get page;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchUserImplCopyWith<_$SearchUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  UserBlocStatus get status => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<User>? get users => throw _privateConstructorUsedError;
  List<User>? get userSearchResults => throw _privateConstructorUsedError;

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
      User? user,
      List<User>? users,
      List<User>? userSearchResults});

  $UserCopyWith<$Res>? get user;
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
    Object? user = freezed,
    Object? users = freezed,
    Object? userSearchResults = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserBlocStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      userSearchResults: freezed == userSearchResults
          ? _value.userSearchResults
          : userSearchResults // ignore: cast_nullable_to_non_nullable
              as List<User>?,
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
      User? user,
      List<User>? users,
      List<User>? userSearchResults});

  @override
  $UserCopyWith<$Res>? get user;
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
    Object? user = freezed,
    Object? users = freezed,
    Object? userSearchResults = freezed,
  }) {
    return _then(_$InitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserBlocStatus,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      userSearchResults: freezed == userSearchResults
          ? _value._userSearchResults
          : userSearchResults // ignore: cast_nullable_to_non_nullable
              as List<User>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.status = UserBlocStatus.initial,
      this.user = null,
      final List<User>? users = null,
      final List<User>? userSearchResults = null})
      : _users = users,
        _userSearchResults = userSearchResults;

  @override
  @JsonKey()
  final UserBlocStatus status;
  @override
  @JsonKey()
  final User? user;
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

  @override
  String toString() {
    return 'UserState(status: $status, user: $user, users: $users, userSearchResults: $userSearchResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality()
                .equals(other._userSearchResults, _userSearchResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      user,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_userSearchResults));

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
      final User? user,
      final List<User>? users,
      final List<User>? userSearchResults}) = _$InitialImpl;

  @override
  UserBlocStatus get status;
  @override
  User? get user;
  @override
  List<User>? get users;
  @override
  List<User>? get userSearchResults;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
