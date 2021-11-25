// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAuthDto _$UserAuthDtoFromJson(Map<String, dynamic> json) => UserAuthDto(
      json['access'] as String,
      json['passenger'] == null
          ? null
          : UserDto.fromJson(json['passenger'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserAuthDtoToJson(UserAuthDto instance) =>
    <String, dynamic>{
      'access': instance.access,
      'passenger': instance.passenger,
    };
