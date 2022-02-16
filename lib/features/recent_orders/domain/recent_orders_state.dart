import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location/location.dart';

part 'recent_orders_state.freezed.dart';

@freezed
class RecentOrdersState with _$RecentOrdersState {
  factory RecentOrdersState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default(false) bool isFinished,
    Stream<QuerySnapshot>? pickUpStream,
    Stream<QuerySnapshot>? forDeliveryStream,
    Stream<QuerySnapshot>? forDeliveredStream,
    LocationData? location,
  }) = _RecentOrdersState;
}
