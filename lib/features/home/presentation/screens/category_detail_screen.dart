import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedala/app/router/app_router.gr.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/core/presentation/widgets/pedala_text.dart';
import 'package:pedala/core/presentation/widgets/scrollable_column.dart';
import 'package:pedala/features/home/data/models/food_category_dto.dart';
import 'package:pedala/features/home/domain/blocs/home_bloc.dart';
import 'package:pedala/features/home/domain/blocs/home_state.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({
    Key? key,
    required this.foodCategory,
  }) : super(key: key);

  final FoodCategoryDto foodCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: CategoryDetailView(foodCategory: foodCategory),
    );
  }
}

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({Key? key, required this.foodCategory})
      : super(key: key);

  final FoodCategoryDto foodCategory;

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (_, state) {},
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.pedalaBody,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            elevation: 0,
            title: const PedalaText.subheading(
              'Category Detail Screen',
              style: TextStyle(
                color: AppColors.pedalaWhite,
                fontSize: 24,
              ),
            ),
          ),
          body: ScrollableColumn(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 30),
            children: <Widget>[
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(foodCategory.categoryUrl),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                key: const ObjectKey(2),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(5, (int index) {
                  return GestureDetector(
                    onTap: () => context.router.push(
                        FoodDetailScreen(food: foodCategory.foods[index])),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      key: ObjectKey(index),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: AppColors.pedalaLightGrey,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              foodCategory.foods[index].imageUrl,
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              PedalaText.subheading(
                                foodCategory.foods[index].name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              PedalaText.subheading(
                                'PHP ${foodCategory.foods[index].price}.00',
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
