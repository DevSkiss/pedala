import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:pedala/app/locator_injection.dart';
import 'package:pedala/features/home/data/models/food_category_dto.dart';
import 'package:pedala/features/home/data/models/food_dto.dart';
import 'package:pedala/features/home/domain/blocs/home_state.dart';
import 'package:pedala/features/home/domain/repositories/home_repository.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';
import 'package:pedala/features/login/data/services/auth_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState()) {
    initialized();
  }

  final HomeRepository _homeRepository = locator<HomeRepository>();
  final AuthApiService _authApiService = locator<AuthApiService>();
  final SharedPreferences _prefs = locator<SharedPreferences>();
  final Location location = Location();

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

  Future<void> logout() async {
    await _authApiService.logout();
  }

  Future<void> createOrder(
      {required String orderProduct, required String total}) async {
    emit(state.copyWith(
      isLoading: true,
      orderSuccess: false,
      hasError: false,
    ));
    log('runs loading');

    try {
      UserDto user = UserDto.fromJson(
          json.decode(_prefs.getString('UserDetailsDTO') ?? ''));
      LocationData pos = await getLocation();
      await _homeRepository.craeteOrder(
        customerId: '${user.userId}',
        customerName: '${user.firstname} ${user.lastname}',
        customerAddress: user.address,
        customerNo: user.contactNo,
        orderStatus: 'pending',
        orderProduct: orderProduct,
        total: total,
        customerLong: pos.longitude.toString(),
        customerLat: pos.latitude.toString(),
        riderLong: '',
        riderLat: '',
        riderId: '',
      );
      emit(state.copyWith(isLoading: false, orderSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<LocationData> getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        log('service not enabled');
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        log('permission not granted');
      }
    }

    return await location.getLocation();
  }
}
