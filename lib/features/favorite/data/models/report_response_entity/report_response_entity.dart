import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_response_entity.freezed.dart';
part 'report_response_entity.g.dart';

@freezed
abstract class ReportResponseEntity with _$ReportResponseEntity {
  const factory ReportResponseEntity({
    final int? id,
    final String? createdAt,
    final String? updatedAt,
    final String? reason,
    final int? userId,
    final int? userAdvertisementId,
  }) = _ReportResponseEntity;
  factory ReportResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseEntityFromJson(json);
}
