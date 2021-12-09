import 'package:json_annotation/json_annotation.dart';
import 'package:pedala/features/home/data/models/food_dto.dart';

part 'food_category_dto.g.dart';

@JsonSerializable()
class FoodCategoryDto {
  FoodCategoryDto({
    required this.category,
    required this.foods,
    required this.categoryUrl,
  });

  factory FoodCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$FoodCategoryDtoToJson(this);

  @JsonKey(name: 'category')
  final String category;

  @JsonKey(name: 'category_url')
  final String categoryUrl;

  @JsonKey(name: 'foods')
  final List<FoodDto> foods;
}
