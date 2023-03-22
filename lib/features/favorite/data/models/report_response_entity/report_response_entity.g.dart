// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportResponseEntity _$$_ReportResponseEntityFromJson(
        Map<String, dynamic> json) =>
    _$_ReportResponseEntity(
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      reason: json['reason'] as String?,
      userId: json['user_id'] as int?,
      userAdvertisementId: json['user_advertisement_id'] as int?,
    );

Map<String, dynamic> _$$_ReportResponseEntityToJson(
        _$_ReportResponseEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'reason': instance.reason,
      'user_id': instance.userId,
      'user_advertisement_id': instance.userAdvertisementId,
    };
