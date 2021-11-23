import 'package:flutter/material.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/core/domain/utils/ui_helpers.dart';
import 'package:pedala/core/presentation/widgets/pedala_text.dart';
import 'package:pedala/core/presentation/widgets/scrollable_column.dart';
import 'package:pedala/generated/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.pedalaBody,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ScrollableColumn(
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
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: AppColors.pedalaBlue,
                    borderRadius: BorderRadius.circular(30),
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
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(20, (index) {
                return Container(
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
                          Assets.images.logo.path,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          PedalaText.subheading(
                            'Bacon Burder',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          PedalaText.subheading(
                            'PHP 5,000.00',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
