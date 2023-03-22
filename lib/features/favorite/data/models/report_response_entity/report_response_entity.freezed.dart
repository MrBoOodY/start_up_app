// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportResponseEntity _$ReportResponseEntityFromJson(Map<String, dynamic> json) {
  return _ReportResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$ReportResponseEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get userAdvertisementId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportResponseEntityCopyWith<ReportResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportResponseEntityCopyWith<$Res> {
  factory $ReportResponseEntityCopyWith(ReportResponseEntity value,
          $Res Function(ReportResponseEntity) then) =
      _$ReportResponseEntityCopyWithImpl<$Res, ReportResponseEntity>;
  @useResult
  $Res call(
      {int? id,
      String? createdAt,
      String? updatedAt,
      String? reason,
      int? userId,
      int? userAdvertisementId});
}

/// @nodoc
class _$ReportResponseEntityCopyWithImpl<$Res,
        $Val extends ReportResponseEntity>
    implements $ReportResponseEntityCopyWith<$Res> {
  _$ReportResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? reason = freezed,
    Object? userId = freezed,
    Object? userAdvertisementId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userAdvertisementId: freezed == userAdvertisementId
          ? _value.userAdvertisementId
          : userAdvertisementId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportResponseEntityCopyWith<$Res>
    implements $ReportResponseEntityCopyWith<$Res> {
  factory _$$_ReportResponseEntityCopyWith(_$_ReportResponseEntity value,
          $Res Function(_$_ReportResponseEntity) then) =
      __$$_ReportResponseEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? createdAt,
      String? updatedAt,
      String? reason,
      int? userId,
      int? userAdvertisementId});
}

/// @nodoc
class __$$_ReportResponseEntityCopyWithImpl<$Res>
    extends _$ReportResponseEntityCopyWithImpl<$Res, _$_ReportResponseEntity>
    implements _$$_ReportResponseEntityCopyWith<$Res> {
  __$$_ReportResponseEntityCopyWithImpl(_$_ReportResponseEntity _value,
      $Res Function(_$_ReportResponseEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? reason = freezed,
    Object? userId = freezed,
    Object? userAdvertisementId = freezed,
  }) {
    return _then(_$_ReportResponseEntity(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      userAdvertisementId: freezed == userAdvertisementId
          ? _value.userAdvertisementId
          : userAdvertisementId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportResponseEntity implements _ReportResponseEntity {
  const _$_ReportResponseEntity(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.reason,
      this.userId,
      this.userAdvertisementId});

  factory _$_ReportResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ReportResponseEntityFromJson(json);

  @override
  final int? id;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? reason;
  @override
  final int? userId;
  @override
  final int? userAdvertisementId;

  @override
  String toString() {
    return 'ReportResponseEntity(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, reason: $reason, userId: $userId, userAdvertisementId: $userAdvertisementId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportResponseEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userAdvertisementId, userAdvertisementId) ||
                other.userAdvertisementId == userAdvertisementId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt, reason,
      userId, userAdvertisementId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportResponseEntityCopyWith<_$_ReportResponseEntity> get copyWith =>
      __$$_ReportResponseEntityCopyWithImpl<_$_ReportResponseEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportResponseEntityToJson(
      this,
    );
  }
}

abstract class _ReportResponseEntity implements ReportResponseEntity {
  const factory _ReportResponseEntity(
      {final int? id,
      final String? createdAt,
      final String? updatedAt,
      final String? reason,
      final int? userId,
      final int? userAdvertisementId}) = _$_ReportResponseEntity;

  factory _ReportResponseEntity.fromJson(Map<String, dynamic> json) =
      _$_ReportResponseEntity.fromJson;

  @override
  int? get id;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get reason;
  @override
  int? get userId;
  @override
  int? get userAdvertisementId;
  @override
  @JsonKey(ignore: true)
  _$$_ReportResponseEntityCopyWith<_$_ReportResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
