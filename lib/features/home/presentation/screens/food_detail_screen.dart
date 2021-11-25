import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/core/presentation/widgets/pedala_button.dart';
import 'package:pedala/core/presentation/widgets/pedala_text.dart';
import 'package:pedala/features/home/data/models/food_dto.dart';
import 'package:pedala/features/home/presentation/screens/order_confirmation_screen.dart';

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({
    Key? key,
    required this.food,
  }) : super(key: key);

  final FoodDto food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding:
            const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 30),
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
            const Spacer(),
            PedalaButton(
              title: 'Confirm Order',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const OrderConfirmationScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
