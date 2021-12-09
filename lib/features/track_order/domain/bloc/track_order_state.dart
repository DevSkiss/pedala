import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_order_state.freezed.dart';

@freezed
class TrackOrderState with _$TrackOrderState {
  factory TrackOrderState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default(false) bool isFinished,
    Stream<QuerySnapshot>? pickUpStream,
    Stream<QuerySnapshot>? forDeliveryStream,
    Stream<QuerySnapshot>? forDeliveredStream,
  }) = _TrackOrderState;
}
