import 'package:json_annotation/json_annotation.dart';

part 'food_dto.g.dart';

@JsonSerializable()
class FoodDto {
  FoodDto({
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory FoodDto.fromJson(Map<String, dynamic> json) =>
      _$FoodDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FoodDtoToJson(this);

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'price')
  final String price;

  @JsonKey(name: 'imageUrl')
  final String imageUrl;
}
