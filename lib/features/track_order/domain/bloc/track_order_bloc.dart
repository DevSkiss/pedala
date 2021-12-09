import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedala/app/locator_injection.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';
import 'package:pedala/features/track_order/domain/bloc/track_order_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrackOrderBloc extends Cubit<TrackOrderState> {
  TrackOrderBloc() : super(TrackOrderState()) {
    initialized();
  }

  final SharedPreferences _prefs = locator<SharedPreferences>();

  void initialized() async {
    UserDto user =
        UserDto.fromJson(json.decode(_prefs.getString('UserDetailsDTO') ?? ''));

    final Stream<QuerySnapshot> _forPickupStream = FirebaseFirestore.instance
        .collection('orders')
        .where('orderStatus', isEqualTo: 'forpickup')
        .where('customerId', isEqualTo: user.userId)
        .snapshots();

    final Stream<QuerySnapshot> _onDeliveryStream = FirebaseFirestore.instance
        .collection('orders')
        .where('orderStatus', isEqualTo: 'delivery')
        .where('customerId', isEqualTo: user.userId)
        .snapshots();

    final Stream<QuerySnapshot> _orderDeliveredStream = FirebaseFirestore
        .instance
        .collection('orders')
        .where('orderStatus', isEqualTo: 'delivered')
        .where('customerId', isEqualTo: user.userId)
        .snapshots();

    emit(state.copyWith(
      pickUpStream: _forPickupStream,
      forDeliveryStream: _onDeliveryStream,
      forDeliveredStream: _orderDeliveredStream,
    ));
  }
}
