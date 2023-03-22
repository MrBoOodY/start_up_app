import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_response_entity.freezed.dart';
part 'like_response_entity.g.dart';

@freezed
abstract class LikeResponseEntity with _$LikeResponseEntity {
  const factory LikeResponseEntity({
    final int? id,
    final String? createdAt,
    final String? updatedAt,
    final int? userId,
    final int? userAdvertisementId,
  }) = _LikeResponseEntity;
  factory LikeResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LikeResponseEntityFromJson(json);
}
