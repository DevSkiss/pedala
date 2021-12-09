// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
      json['customerId'] as String,
      json['customerName'] as String,
      json['customerAddress'] as String,
      json['orderStatus'] as String,
      json['orderProduct'] as String,
      json['total'] as String,
      json['customerLong'] as String,
      json['customerLat'] as String,
      json['riderLong'] as String,
      json['riderLat'] as String,
    );

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'customerAddress': instance.customerAddress,
      'orderStatus': instance.orderStatus,
      'orderProduct': instance.orderProduct,
      'total': instance.total,
      'customerLong': instance.customerLong,
      'customerLat': instance.customerLat,
      'riderLong': instance.riderLong,
      'riderLat': instance.riderLat,
    };
