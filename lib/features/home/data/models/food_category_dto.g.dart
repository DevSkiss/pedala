// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodCategoryDto _$FoodCategoryDtoFromJson(Map<String, dynamic> json) =>
    FoodCategoryDto(
      category: json['category'] as String,
      foods: (json['foods'] as List<dynamic>)
          .map((e) => FoodDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryUrl: json['category_url'] as String,
    );

Map<String, dynamic> _$FoodCategoryDtoToJson(FoodCategoryDto instance) =>
    <String, dynamic>{
      'category': instance.category,
      'category_url': instance.categoryUrl,
      'foods': instance.foods,
    };
