import 'package:json_annotation/json_annotation.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';

part 'user_auth_dto.g.dart';

@JsonSerializable()
class UserAuthDto {
  UserAuthDto(
    this.access,
    this.passenger,
  );

  factory UserAuthDto.fromJson(Map<String, dynamic> json) =>
      _$UserAuthDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserAuthDtoToJson(this);
  @JsonKey(name: 'access')
  final String access;

  @JsonKey(name: 'passenger')
  final UserDto? passenger;
}
