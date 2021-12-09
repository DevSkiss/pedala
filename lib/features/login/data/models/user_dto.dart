import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  UserDto(
    this.firstname,
    this.lastname,
    this.email,
    this.usertype,
    this.userId,
    this.address,
    this.contactNo,
    this.longitude,
    this.latitude,
  );

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @JsonKey(name: 'firstname')
  final String? firstname;

  @JsonKey(name: 'lastname')
  final String? lastname;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'contactNo')
  final String contactNo;

  @JsonKey(name: 'usertype')
  final String? usertype;

  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'longitude')
  final String longitude;

  @JsonKey(name: 'latitude')
  final String latitude;
}
