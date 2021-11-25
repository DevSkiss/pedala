import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  UserDto(
    this.firstname,
    this.lastname,
    this.username,
    this.password,
    this.id,
    this.active,
    this.createdAt,
  );

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @JsonKey(name: 'firstname')
  final String? firstname;

  @JsonKey(name: 'lastname')
  final String? lastname;

  @JsonKey(name: 'username')
  final String? username;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: 'active')
  final bool? active;

  @JsonKey(name: 'createdAt')
  final String? createdAt;
}
