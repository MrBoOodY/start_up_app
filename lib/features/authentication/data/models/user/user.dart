import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    final int? id,
    final String? name,
    final String? surname,
    final String? email,
    final String? phone,
    final String? img,
    final String? banner,
    final int? countryId,
    final int? areaId,
    final int? cityId,
    final String? gender,
    final DateTime? birthDay,
    final bool? isShop,
    final bool? isNotification,
    final String? fullPathImage,
    final String? fullPathImageBurner,
    final String? location,
    final String? whatsapp,
    final String? imageBanner,
    final String? website,
    final String? instagram,
    final String? storeActivity,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
