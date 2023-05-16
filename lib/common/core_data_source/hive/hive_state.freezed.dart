// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hive_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HiveState {
  Box<String>? get userTokenBox => throw _privateConstructorUsedError;
  Box<User>? get userBox => throw _privateConstructorUsedError;
  Box<bool>? get darkModeBox => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HiveStateCopyWith<HiveState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HiveStateCopyWith<$Res> {
  factory $HiveStateCopyWith(HiveState value, $Res Function(HiveState) then) =
      _$HiveStateCopyWithImpl<$Res, HiveState>;
  @useResult
  $Res call(
      {Box<String>? userTokenBox, Box<User>? userBox, Box<bool>? darkModeBox});
}

/// @nodoc
class _$HiveStateCopyWithImpl<$Res, $Val extends HiveState>
    implements $HiveStateCopyWith<$Res> {
  _$HiveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userTokenBox = freezed,
    Object? userBox = freezed,
    Object? darkModeBox = freezed,
  }) {
    return _then(_value.copyWith(
      userTokenBox: freezed == userTokenBox
          ? _value.userTokenBox
          : userTokenBox // ignore: cast_nullable_to_non_nullable
              as Box<String>?,
      userBox: freezed == userBox
          ? _value.userBox
          : userBox // ignore: cast_nullable_to_non_nullable
              as Box<User>?,
      darkModeBox: freezed == darkModeBox
          ? _value.darkModeBox
          : darkModeBox // ignore: cast_nullable_to_non_nullable
              as Box<bool>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HiveStateCopyWith<$Res> implements $HiveStateCopyWith<$Res> {
  factory _$$_HiveStateCopyWith(
          _$_HiveState value, $Res Function(_$_HiveState) then) =
      __$$_HiveStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Box<String>? userTokenBox, Box<User>? userBox, Box<bool>? darkModeBox});
}

/// @nodoc
class __$$_HiveStateCopyWithImpl<$Res>
    extends _$HiveStateCopyWithImpl<$Res, _$_HiveState>
    implements _$$_HiveStateCopyWith<$Res> {
  __$$_HiveStateCopyWithImpl(
      _$_HiveState _value, $Res Function(_$_HiveState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userTokenBox = freezed,
    Object? userBox = freezed,
    Object? darkModeBox = freezed,
  }) {
    return _then(_$_HiveState(
      userTokenBox: freezed == userTokenBox
          ? _value.userTokenBox
          : userTokenBox // ignore: cast_nullable_to_non_nullable
              as Box<String>?,
      userBox: freezed == userBox
          ? _value.userBox
          : userBox // ignore: cast_nullable_to_non_nullable
              as Box<User>?,
      darkModeBox: freezed == darkModeBox
          ? _value.darkModeBox
          : darkModeBox // ignore: cast_nullable_to_non_nullable
              as Box<bool>?,
    ));
  }
}

/// @nodoc

class _$_HiveState extends _HiveState {
  const _$_HiveState({this.userTokenBox, this.userBox, this.darkModeBox})
      : super._();

  @override
  final Box<String>? userTokenBox;
  @override
  final Box<User>? userBox;
  @override
  final Box<bool>? darkModeBox;

  @override
  String toString() {
    return 'HiveState(userTokenBox: $userTokenBox, userBox: $userBox, darkModeBox: $darkModeBox)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HiveState &&
            (identical(other.userTokenBox, userTokenBox) ||
                other.userTokenBox == userTokenBox) &&
            (identical(other.userBox, userBox) || other.userBox == userBox) &&
            (identical(other.darkModeBox, darkModeBox) ||
                other.darkModeBox == darkModeBox));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userTokenBox, userBox, darkModeBox);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HiveStateCopyWith<_$_HiveState> get copyWith =>
      __$$_HiveStateCopyWithImpl<_$_HiveState>(this, _$identity);
}

abstract class _HiveState extends HiveState {
  const factory _HiveState(
      {final Box<String>? userTokenBox,
      final Box<User>? userBox,
      final Box<bool>? darkModeBox}) = _$_HiveState;
  const _HiveState._() : super._();

  @override
  Box<String>? get userTokenBox;
  @override
  Box<User>? get userBox;
  @override
  Box<bool>? get darkModeBox;
  @override
  @JsonKey(ignore: true)
  _$$_HiveStateCopyWith<_$_HiveState> get copyWith =>
      throw _privateConstructorUsedError;
}
