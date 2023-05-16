// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      accessToken: json['access_token'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      img: json['img'] as String?,
      banner: json['banner'] as String?,
      countryId: json['country_id'] as int?,
      areaId: json['area_id'] as int?,
      cityId: json['city_id'] as int?,
      gender: json['gender'] as String?,
      birthDay: json['birth_day'] == null
          ? null
          : DateTime.parse(json['birth_day'] as String),
      isShop: json['is_shop'] as bool?,
      isNotification: json['is_notification'] as bool?,
      fullPathImage: json['full_path_image'] as String?,
      fullPathImageBurner: json['full_path_image_burner'] as String?,
      location: json['location'] as String?,
      whatsapp: json['whatsapp'] as String?,
      imageBanner: json['image_banner'] as String?,
      website: json['website'] as String?,
      instagram: json['instagram'] as String?,
      storeActivity: json['store_activity'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'access_token': instance.accessToken,
      'email': instance.email,
      'phone': instance.phone,
      'img': instance.img,
      'banner': instance.banner,
      'country_id': instance.countryId,
      'area_id': instance.areaId,
      'city_id': instance.cityId,
      'gender': instance.gender,
      'birth_day': instance.birthDay?.toIso8601String(),
      'is_shop': instance.isShop,
      'is_notification': instance.isNotification,
      'full_path_image': instance.fullPathImage,
      'full_path_image_burner': instance.fullPathImageBurner,
      'location': instance.location,
      'whatsapp': instance.whatsapp,
      'image_banner': instance.imageBanner,
      'website': instance.website,
      'instagram': instance.instagram,
      'store_activity': instance.storeActivity,
    };
