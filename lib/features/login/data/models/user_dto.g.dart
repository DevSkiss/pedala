// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      json['firstname'] as String?,
      json['lastname'] as String?,
      json['email'] as String?,
      json['usertype'] as String?,
      json['user_id'] as String?,
      json['address'] as String,
      json['contactNo'] as String,
      json['longitude'] as String,
      json['latitude'] as String,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'address': instance.address,
      'contactNo': instance.contactNo,
      'usertype': instance.usertype,
      'user_id': instance.userId,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
