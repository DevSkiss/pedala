import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pedala/app/router/app_router.gr.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/core/presentation/widgets/pedala_text.dart';
import 'package:pedala/features/recent_orders/domain/recent_orders_bloc.dart';
import 'package:pedala/features/recent_orders/domain/recent_orders_state.dart';

class RecentOrdersScreen extends StatelessWidget {
  const RecentOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecentOrdersBloc(),
      child: const RecentOrdersView(),
    );
  }
}

class RecentOrdersView extends StatefulWidget {
  const RecentOrdersView({Key? key}) : super(key: key);

  @override
  State<RecentOrdersView> createState() => _RecentOrdersViewState();
}

class _RecentOrdersViewState extends State<RecentOrdersView> {
  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return BlocConsumer<RecentOrdersBloc, RecentOrdersState>(
      listener: (BuildContext context, RecentOrdersState state) {},
      builder: (BuildContext context, RecentOrdersState state) {
        return Scaffold(
            appBar: AppBar(
              title: const PedalaText.subheading(
                'Orders',
                style: TextStyle(
                  color: AppColors.pedalaBody,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: AppColors.pedalaLightGrey,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        PedalaText.subheading(
                          'For Pickup',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PedalaText.subheading(
                          'Scroll Here',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: state.pickUpStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return PedalaText.body('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      return Column(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return ListTile(
                              title: Text(
                                data['orderProduct'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              subtitle: Text(
                                  '${data['customerAddress']}\n${data['customerNo']}\nPHP ${data['total']}'),
                              trailing: GestureDetector(
                                onTap: () => context
                                    .read<RecentOrdersBloc>()
                                    .updateStatus(
                                        status: 'delivery',
                                        orderId: document.id),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.pedalaBody,
                                      borderRadius: BorderRadius.circular(8)),
                                  padding: const EdgeInsets.all(8.0),
                                  child: const PedalaText.subheading(
                                      'Pickup Order',
                                      style: TextStyle(
                                        color: AppColors.pedalaWhite,
                                        fontSize: 16,
                                      )),
                                ),
                              ));
                        }).toList(),
                      );
                    },
                  ),
                  Container(
                    color: AppColors.pedalaLightGrey,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        PedalaText.subheading(
                          'For Delivery',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PedalaText.subheading(
                          'Scroll Here',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: state.forDeliveryStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return PedalaText.body('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      return ListView(
                        shrinkWrap: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return Slidable(
                            key: ObjectKey(document.id),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (_) => context.router.push(
                                    OrderConfirmation(
                                      customerLat: data['customerLat'],
                                      customerLong: data['customerLong'],
                                      riderLat: data['riderLat'],
                                      riderLong: data['riderLong'],
                                    ),
                                  ),
                                  backgroundColor: const Color(0xFF0392CF),
                                  foregroundColor: Colors.white,
                                  icon: Icons.map,
                                  label: 'Map',
                                ),
                              ],
                            ),
                            child: ListTile(
                                title: Text(
                                  data['orderProduct'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                subtitle: Text(
                                    '${data['customerAddress']}\n${data['customerNo']}\nPHP ${data['total']}'),
                                trailing: GestureDetector(
                                  onTap: () => context
                                      .read<RecentOrdersBloc>()
                                      .updateStatus(
                                          status: 'delivered',
                                          orderId: document.id),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.pedalaOrange,
                                        borderRadius: BorderRadius.circular(8)),
                                    padding: const EdgeInsets.all(8.0),
                                    child: const PedalaText.subheading(
                                        'Deliver Order',
                                        style: TextStyle(
                                          color: AppColors.pedalaWhite,
                                          fontSize: 16,
                                        )),
                                  ),
                                )),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  Container(
                    color: AppColors.pedalaLightGrey,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        PedalaText.subheading(
                          'Deliverd / Done',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PedalaText.subheading(
                          'Scroll Here',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: state.forDeliveredStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return PedalaText.body('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      return ListView(
                        shrinkWrap: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return ListTile(
                              title: Text(
                                data['orderProduct'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              subtitle: Text(
                                  '${data['customerAddress']}\n${data['customerNo']}\nPHP ${data['total']}'),
                              trailing: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.pedalaRed,
                                    borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.all(8.0),
                                child: const PedalaText.subheading('Delivered',
                                    style: TextStyle(
                                      color: AppColors.pedalaWhite,
                                      fontSize: 16,
                                    )),
                              ));
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
