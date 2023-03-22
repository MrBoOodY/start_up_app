// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LikeResponseEntity _$$_LikeResponseEntityFromJson(
        Map<String, dynamic> json) =>
    _$_LikeResponseEntity(
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      userId: json['user_id'] as int?,
      userAdvertisementId: json['user_advertisement_id'] as int?,
    );

Map<String, dynamic> _$$_LikeResponseEntityToJson(
        _$_LikeResponseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user_id': instance.userId,
      'user_advertisement_id': instance.userAdvertisementId,
    };
