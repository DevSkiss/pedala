import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedala/app/router/app_router.gr.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/core/presentation/widgets/pedala_text.dart';
import 'package:pedala/features/dashboard/domain/driver_dashboard_bloc.dart';
import 'package:pedala/features/dashboard/domain/driver_dashboard_state.dart';

class DriverDashboardScreen extends StatelessWidget {
  const DriverDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DriverDashboardBloc(),
      child: const DriverDashboardView(),
    );
  }
}

class DriverDashboardView extends StatefulWidget {
  const DriverDashboardView({Key? key}) : super(key: key);

  @override
  State<DriverDashboardView> createState() => _DriverDashboardViewState();
}

class _DriverDashboardViewState extends State<DriverDashboardView> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 15),
        (Timer t) => context.read<DriverDashboardBloc>().updateRiderLocation());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return BlocConsumer<DriverDashboardBloc, DriverDashboardState>(
      listener: (BuildContext context, DriverDashboardState state) {},
      builder: (BuildContext context, DriverDashboardState state) {
        return Scaffold(
          appBar: AppBar(
            title: const PedalaText.subheading(
              'Driver Dashboard',
              style: TextStyle(
                color: AppColors.pedalaBody,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  timer?.cancel();
                  context
                      .read<DriverDashboardBloc>()
                      .locationSubscription
                      .cancel();
                  context.read<DriverDashboardBloc>().logout();
                  context.router.replace(const LoginScreen());
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: AppColors.pedalaBody,
                ),
              )
            ],
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: context.read<DriverDashboardBloc>().orderStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return PedalaText.body('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              return Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: PedalaText.subheading(
                      'Customer Orders',
                      style: TextStyle(
                        color: AppColors.pedalaBody,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return ListTile(
                            title: Text(
                              data['orderProduct'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            subtitle: Text(
                                '${data['customerAddress']}\n${data['customerNo']}\nPHP ${data['total']}'),
                            trailing: GestureDetector(
                              onTap: () => context
                                  .read<DriverDashboardBloc>()
                                  .updateOrder(
                                    riderLat:
                                        state.location?.latitude.toString() ??
                                            '',
                                    riderLong:
                                        state.location?.longitude.toString() ??
                                            '',
                                    orderId: document.id,
                                  ),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.pedalaBlue,
                                    borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.all(8.0),
                                child: const PedalaText.subheading('Get Order',
                                    style: TextStyle(
                                      color: AppColors.pedalaWhite,
                                      fontSize: 16,
                                    )),
                              ),
                            ));
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
