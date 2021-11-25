import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pedala/features/home/data/models/food_category_dto.dart';
import 'package:pedala/features/home/data/models/food_dto.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(false) isLoading,
    @Default(false) hasError,
    @Default(false) isFinished,
    List<FoodCategoryDto>? foodCategory,
    List<FoodDto>? foodDto,
  }) = _HomeState;
}
