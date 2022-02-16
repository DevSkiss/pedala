import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:pedala/app/locator_injection.dart';
import 'package:pedala/features/home/data/services/home_api_service.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';
import 'package:pedala/features/recent_orders/domain/recent_orders_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentOrdersBloc extends Cubit<RecentOrdersState> {
  RecentOrdersBloc() : super(RecentOrdersState()) {
    initialized();
  }

  final HomeApiService _homeApiService = locator<HomeApiService>();
  final SharedPreferences _prefs = locator<SharedPreferences>();

  void initialized() async {
    UserDto user =
        UserDto.fromJson(json.decode(_prefs.getString('UserDetailsDTO') ?? ''));

    final Stream<QuerySnapshot> _forPickupStream = FirebaseFirestore.instance
        .collection('orders')
        .where('orderStatus', isEqualTo: 'forpickup')
        .where('riderId', isEqualTo: user.userId)
        .snapshots();

    final Stream<QuerySnapshot> _onDeliveryStream = FirebaseFirestore.instance
        .collection('orders')
        .where('orderStatus', isEqualTo: 'delivery')
        .where('riderId', isEqualTo: user.userId)
        .snapshots();

    final Stream<QuerySnapshot> _orderDeliveredStream = FirebaseFirestore
        .instance
        .collection('orders')
        .where('orderStatus', isEqualTo: 'delivered')
        .where('riderId', isEqualTo: user.userId)
        .snapshots();

    emit(state.copyWith(
      pickUpStream: _forPickupStream,
      forDeliveryStream: _onDeliveryStream,
      forDeliveredStream: _orderDeliveredStream,
    ));
  }

  final Location location = Location();

  Future<void> updateStatus(
      {required String status, required String orderId}) async {
    try {
      await _homeApiService.updateOrderStatus(status: status, orderId: orderId);
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(hasError: true));
    }
  }
}
