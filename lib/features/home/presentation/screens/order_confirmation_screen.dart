import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/core/domain/utils/dialog_utils.dart';
import 'package:pedala/core/presentation/widgets/pedala_button.dart';
import 'package:pedala/core/presentation/widgets/pedala_text.dart';
import 'package:pedala/features/menu/presentation/screens/menu_screen.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(13.157693, 121.186784),
    zoom: 15.5,
  );

  GoogleMapController? _controller;
  Marker origin = Marker(
    markerId: const MarkerId('origin'),
    infoWindow: const InfoWindow(title: 'Origin'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: const LatLng(13.157693, 121.186784),
  );

  Marker destination = Marker(
    markerId: const MarkerId(''),
    infoWindow: const InfoWindow(title: 'Da Front'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(13.165298, 121.186296),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pedalaBody,
        title: const PedalaText.subheading(
          'Delivery Rider is on its way!',
          style: TextStyle(
            color: AppColors.pedalaWhite,
            fontSize: 24,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            initialCameraPosition: _initialCameraPosition,
            markers: {
              origin,
              destination,
            },
            onMapCreated: (controller) => _controller = controller,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                const Spacer(),
                PedalaButton(
                  title: 'Received Order',
                  onTap: () {
                    DialogUtils.showRating(
                      context,
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const MenuScreen(),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20)
              ],
            ),
          )
        ],
      ),
    );
  }
}
