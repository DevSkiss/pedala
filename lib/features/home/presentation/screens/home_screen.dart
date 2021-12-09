import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/core/domain/utils/ui_helpers.dart';
import 'package:pedala/core/presentation/widgets/pedala_text.dart';
import 'package:pedala/core/presentation/widgets/scrollable_column.dart';
import 'package:pedala/features/home/domain/blocs/home_bloc.dart';
import 'package:pedala/features/home/domain/blocs/home_state.dart';
import 'package:pedala/features/home/presentation/screens/category_detail_screen.dart';
import 'package:pedala/features/home/presentation/screens/food_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.pedalaWhite,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.pedalaWhite,
            centerTitle: false,
            title: const PedalaText.subheading(
              'Home',
              style: TextStyle(
                color: AppColors.pedalaBody,
              ),
            ),
          ),
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ScrollableColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: <Widget>[
                    const PedalaText.subheading(
                      'All Products',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpaceSmall,
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.foodCategory?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        CategoryDetailScreen(
                                            foodCategory:
                                                state.foodCategory![index]))),
                            child: Container(
                              height: 80,
                              width: 120,
                              margin: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                color: AppColors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(
                                      state.foodCategory?[index].categoryUrl ??
                                          ''),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    verticalSpaceSmall,
                    const PedalaText.subheading(
                      'Most Popular',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpaceSmall,
                    GridView.count(
                      crossAxisCount: 2,
                      key: const ObjectKey(2),
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(state.foodDto?.length ?? 0,
                          (int index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      FoodDetailScreen(
                                        food: state.foodDto![index],
                                      ))),
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
                                    state.foodDto?[index].imageUrl ?? '',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    PedalaText.subheading(
                                      state.foodDto?[index].name ?? '',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    PedalaText.subheading(
                                      'PHP ${state.foodDto?[index].price ?? ''}.00',
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
