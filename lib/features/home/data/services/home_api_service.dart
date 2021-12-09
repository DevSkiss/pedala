import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract class HomeApiService {
  Future<void> createOrder({
    required String customerId,
    required String customerName,
    required String customerAddress,
    required String customerNo,
    required String orderStatus,
    required String orderProduct,
    required String total,
    required String customerLong,
    required String customerLat,
    required String riderId,
  });

  Future<void> updateOrder({
    required String riderLat,
    required String riderLong,
    required String riderId,
    required String orderId,
  });

  Future<void> updateRiderLocation({
    required String riderLat,
    required String riderLong,
    required String riderId,
  });

  Future<void> updateOrderStatus(
      {required String status, required String orderId});
}

class HomeApiServiceImpl implements HomeApiService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> createOrder({
    required String customerId,
    required String customerName,
    required String customerAddress,
    required String customerNo,
    required String orderStatus,
    required String orderProduct,
    required String total,
    required String customerLong,
    required String customerLat,
    required String riderId,
  }) async {
    CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');
    try {
      await orders.add({
        'customerId': customerId,
        'customerName': customerName,
        'customerAddress': customerAddress,
        'customerNo': customerNo,
        'orderStatus': orderStatus,
        'orderProduct': orderProduct,
        'total': total,
        'customerLong': customerLong,
        'customerLat': customerLat,
        'riderLong': '',
        'riderLat': '',
        'riderId': '',
      });
    } on FirebaseFirestore catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> updateOrder({
    required String riderLat,
    required String riderLong,
    required String riderId,
    required String orderId,
  }) async {
    try {
      CollectionReference orders =
          FirebaseFirestore.instance.collection('orders');
      orders
          .doc(orderId)
          .update({
            'riderLat': riderLat,
            'riderLong': riderLong,
            'riderId': riderId,
            'orderStatus': 'forpickup',
          })
          .then((value) => debugPrint("Order Updated"))
          .catchError((error) => debugPrint("Failed to update user: $error"));
    } catch (e) {
      debugPrint(e.toString());
      throw UnimplementedError();
    }
  }

  @override
  Future<void> updateOrderStatus(
      {required String status, required String orderId}) async {
    try {
      CollectionReference orders =
          FirebaseFirestore.instance.collection('orders');
      orders
          .doc(orderId)
          .update({
            'orderStatus': status,
          })
          .then((value) => debugPrint("Order Status Updated"))
          .catchError((error) => debugPrint("Failed to update user: $error"));
    } catch (e) {
      debugPrint(e.toString());
      throw UnimplementedError();
    }
  }

  @override
  Future<void> updateRiderLocation(
      {required String riderLat,
      required String riderLong,
      required String riderId}) async {
    try {
      CollectionReference orders =
          FirebaseFirestore.instance.collection('orders');

      var result = await firestore
          .collection('orders')
          .where('riderId', isEqualTo: riderId)
          .get();

      for (var doc in result.docs) {
        orders
            .doc(doc.id)
            .update({
              'riderLat': riderLat,
              'riderLong': riderLong,
            })
            .then((value) => debugPrint('Driver Position Updated'))
            .catchError((error) => debugPrint("Failed to update user: $error"));
      }
    } catch (e) {
      debugPrint(e.toString());
      throw UnimplementedError();
    }
  }
}
