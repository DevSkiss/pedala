import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedala/app/locator_injection.dart';
import 'package:pedala/features/home/data/models/food_category_dto.dart';
import 'package:pedala/features/home/data/models/food_dto.dart';
import 'package:pedala/features/home/domain/blocs/home_state.dart';
import 'package:pedala/features/home/domain/repositories/home_repository.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState()) {
    initialized();
  }

  final HomeRepository _homeRepository = locator<HomeRepository>();

  void initialized() async {
    emit(state.copyWith(isLoading: true));
    List<FoodCategoryDto> listCategory =
        await _homeRepository.getCategoryList();
    List<FoodDto> listFood = await _homeRepository.getAllFood();
    emit(state.copyWith(
        isLoading: false,
        isFinished: true,
        foodCategory: listCategory,
        foodDto: listFood));
  }
}
