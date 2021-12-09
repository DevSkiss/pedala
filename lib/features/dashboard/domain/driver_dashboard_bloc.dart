import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:pedala/app/locator_injection.dart';
import 'package:pedala/features/dashboard/domain/driver_dashboard_state.dart';
import 'package:pedala/features/home/data/services/home_api_service.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';
import 'package:pedala/features/login/data/services/auth_api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverDashboardBloc extends Cubit<DriverDashboardState> {
  DriverDashboardBloc() : super(DriverDashboardState()) {
    initialized();
  }

  final AuthApiService _authApiService = locator<AuthApiService>();
  final HomeApiService _homeApiService = locator<HomeApiService>();
  final SharedPreferences _prefs = locator<SharedPreferences>();
  late StreamSubscription<LocationData> locationSubscription;

  void updateRiderLocation() async {
    log('UPDATE RIDER LOCATION');
    UserDto user =
        UserDto.fromJson(json.decode(_prefs.getString('UserDetailsDTO') ?? ''));

    _homeApiService.updateRiderLocation(
      riderLat: state.location?.latitude.toString() ?? '',
      riderLong: state.location?.longitude.toString() ?? '',
      riderId: user.userId ?? '',
    );
  }

  final Stream<QuerySnapshot> _orderStream = FirebaseFirestore.instance
      .collection('orders')
      .where('orderStatus', isEqualTo: 'pending')
      .snapshots();
  final Location location = Location();

  Stream<QuerySnapshot> get orderStream => _orderStream;

  void initialized() async {
    getLocation();
  }

  Future<void> logout() async {
    await _authApiService.logout();
  }

  void updateMyLocation() {}

  Future<void> updateOrder({
    required String riderLat,
    required String riderLong,
    required String orderId,
  }) async {
    try {
      UserDto user = UserDto.fromJson(
          json.decode(_prefs.getString('UserDetailsDTO') ?? ''));

      _homeApiService.updateOrder(
        riderLat: riderLat,
        riderLong: riderLong,
        orderId: orderId,
        riderId: user.userId ?? '',
      );
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> getLocation() async {
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

    locationSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) {
      emit(state.copyWith(location: currentLocation));
    });
  }
}
