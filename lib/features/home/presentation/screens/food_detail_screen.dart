import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/core/domain/utils/dialog_utils.dart';
import 'package:pedala/core/domain/utils/ui_helpers.dart';
import 'package:pedala/core/presentation/widgets/pedala_button.dart';
import 'package:pedala/core/presentation/widgets/pedala_text.dart';
import 'package:pedala/features/home/data/models/food_dto.dart';
import 'package:pedala/features/home/domain/blocs/home_bloc.dart';
import 'package:pedala/features/home/domain/blocs/home_state.dart';

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({
    Key? key,
    required this.food,
  }) : super(key: key);

  final FoodDto food;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: FoodDetailView(
        food: food,
      ),
    );
  }
}

class FoodDetailView extends StatelessWidget {
  const FoodDetailView({Key? key, required this.food}) : super(key: key);

  final FoodDto food;

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (_, state) {
        if (state.orderSuccess) {
          DialogUtils.showDialogMessage(context,
              title: 'Pedala', message: 'Order Success');
        }
      },
      builder: (_, state) {
        return state.isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  verticalSpaceMedium,
                  PedalaText.subheading(
                    'Creating Order',
                    style: TextStyle(
                      color: AppColors.pedalaBody,
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.pedalaBody,
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  elevation: 0,
                  title: const PedalaText.subheading(
                    'Food Detail Screen',
                    style: TextStyle(
                      color: AppColors.pedalaWhite,
                      fontSize: 24,
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16)
                      .copyWith(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(food.imageUrl),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      PedalaText.headingTwo(food.name),
                      PedalaText.subheading(
                        'PHP ${food.price}.00',
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.pedalaRed,
                        ),
                      ),
                      verticalSpaceMedium,
                      const PedalaText.subheading(
                        'Payment: Cash on Delivery',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      PedalaButton(
                        title: 'Confirm Order',
                        onTap: () => context.read<HomeBloc>().createOrder(
                              orderProduct: food.name,
                              total: food.price,
                            ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
