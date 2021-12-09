// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodDto _$FoodDtoFromJson(Map<String, dynamic> json) => FoodDto(
      name: json['name'] as String,
      price: json['price'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$FoodDtoToJson(FoodDto instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
    };
