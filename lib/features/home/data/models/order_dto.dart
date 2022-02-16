import 'package:json_annotation/json_annotation.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  OrderDto(
      this.customerId,
      this.customerName,
      this.customerAddress,
      this.orderStatus,
      this.orderProduct,
      this.total,
      this.customerLong,
      this.customerLat,
      this.riderLong,
      this.riderLat);

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);

  @JsonKey(name: 'customerId')
  final String customerId;

  @JsonKey(name: 'customerName')
  final String customerName;

  @JsonKey(name: 'customerAddress')
  final String customerAddress;

  @JsonKey(name: 'orderStatus')
  final String orderStatus;

  @JsonKey(name: 'orderProduct')
  final String orderProduct;

  @JsonKey(name: 'total')
  final String total;

  @JsonKey(name: 'customerLong')
  final String customerLong;

  @JsonKey(name: 'customerLat')
  final String customerLat;

  @JsonKey(name: 'riderLong')
  final String riderLong;

  @JsonKey(name: 'riderLat')
  final String riderLat;
}
