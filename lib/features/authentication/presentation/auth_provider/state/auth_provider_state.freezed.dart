// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthProviderState {
  bool get isLoggedIn => throw _privateConstructorUsedError;
  User? get currentUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthProviderStateCopyWith<AuthProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthProviderStateCopyWith<$Res> {
  factory $AuthProviderStateCopyWith(
          AuthProviderState value, $Res Function(AuthProviderState) then) =
      _$AuthProviderStateCopyWithImpl<$Res, AuthProviderState>;
  @useResult
  $Res call({bool isLoggedIn, User? currentUser});

  $UserCopyWith<$Res>? get currentUser;
}

/// @nodoc
class _$AuthProviderStateCopyWithImpl<$Res, $Val extends AuthProviderState>
    implements $AuthProviderStateCopyWith<$Res> {
  _$AuthProviderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? currentUser = freezed,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get currentUser {
    if (_value.currentUser == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.currentUser!, (value) {
      return _then(_value.copyWith(currentUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthProviderStateCopyWith<$Res>
    implements $AuthProviderStateCopyWith<$Res> {
  factory _$$_AuthProviderStateCopyWith(_$_AuthProviderState value,
          $Res Function(_$_AuthProviderState) then) =
      __$$_AuthProviderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoggedIn, User? currentUser});

  @override
  $UserCopyWith<$Res>? get currentUser;
}

/// @nodoc
class __$$_AuthProviderStateCopyWithImpl<$Res>
    extends _$AuthProviderStateCopyWithImpl<$Res, _$_AuthProviderState>
    implements _$$_AuthProviderStateCopyWith<$Res> {
  __$$_AuthProviderStateCopyWithImpl(
      _$_AuthProviderState _value, $Res Function(_$_AuthProviderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoggedIn = null,
    Object? currentUser = freezed,
  }) {
    return _then(_$_AuthProviderState(
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$_AuthProviderState implements _AuthProviderState {
  const _$_AuthProviderState({this.isLoggedIn = false, this.currentUser});

  @override
  @JsonKey()
  final bool isLoggedIn;
  @override
  final User? currentUser;

  @override
  String toString() {
    return 'AuthProviderState(isLoggedIn: $isLoggedIn, currentUser: $currentUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthProviderState &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoggedIn, currentUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthProviderStateCopyWith<_$_AuthProviderState> get copyWith =>
      __$$_AuthProviderStateCopyWithImpl<_$_AuthProviderState>(
          this, _$identity);
}

abstract class _AuthProviderState implements AuthProviderState {
  const factory _AuthProviderState(
      {final bool isLoggedIn, final User? currentUser}) = _$_AuthProviderState;

  @override
  bool get isLoggedIn;
  @override
  User? get currentUser;
  @override
  @JsonKey(ignore: true)
  _$$_AuthProviderStateCopyWith<_$_AuthProviderState> get copyWith =>
      throw _privateConstructorUsedError;
}
