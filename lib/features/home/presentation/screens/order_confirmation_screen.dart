import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/core/presentation/widgets/pedala_text.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({
    Key? key,
    required this.customerLat,
    required this.customerLong,
    required this.riderLat,
    required this.riderLong,
    this.isCustomer = false,
  }) : super(key: key);

  final String customerLat;
  final String customerLong;
  final String riderLat;
  final String riderLong;
  final bool isCustomer;

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  Marker? origin;
  Marker? destination;
  final Location location = Location();
  LatLng? position;
  StreamSubscription<LocationData>? locationSubscription;

  GoogleMapController? _controller;

  @override
  void initState() {
    locationSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        position = LatLng(
          currentLocation.latitude ?? 11,
          currentLocation.longitude ?? 124,
        );
        _controller?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: position ?? const LatLng(13.121128, 121.081782),
              zoom: 16.5,
            ),
          ),
        );
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    destination = Marker(
      markerId: const MarkerId(''),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: widget.isCustomer
          ? LatLng(
              double.parse(widget.riderLat), double.parse(widget.riderLong))
          : LatLng(double.parse(widget.customerLat),
              double.parse(widget.customerLong)),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    locationSubscription?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pedalaBody,
        title: PedalaText.subheading(
          widget.isCustomer ? 'Delivery ' : 'Delivery Rider is on its way!',
          style: const TextStyle(
            color: AppColors.pedalaWhite,
            fontSize: 15,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            initialCameraPosition: CameraPosition(
              target: position ?? const LatLng(13.121128, 121.081782),
              zoom: 15.5,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('Me'),
                infoWindow: InfoWindow(
                    title: widget.isCustomer ? 'Customer' : 'Driver'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue),
                position: position ?? const LatLng(13.121128, 121.081782),
              ),
              destination ??
                  Marker(
                      markerId:
                          MarkerId(widget.isCustomer ? 'Driver' : 'Customer')),
            },
            onMapCreated: (controller) => _controller = controller,
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
            margin: const EdgeInsets.only(top: 130, left: 30),
            child: Row(
              children: <Widget>[
                FloatingActionButton(
                  child: const Icon(Icons.location_on),
                  onPressed: () => _controller?.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: position ?? const LatLng(13.121128, 121.081782),
                        zoom: 16.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  backgroundColor: AppColors.pedalaRed,
                  tooltip: widget.isCustomer ? 'Driver' : 'Customer',
                  child: const Icon(
                    Icons.location_on,
                  ),
                  onPressed: () => _controller?.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: widget.isCustomer
                            ? LatLng(double.parse(widget.riderLat),
                                double.parse(widget.riderLong))
                            : LatLng(double.parse(widget.customerLat),
                                double.parse(widget.customerLong)),
                        zoom: 16.5,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
