import 'package:pedala/app/locator_injection.dart';
import 'package:pedala/features/home/data/models/food_category_dto.dart';
import 'package:pedala/features/home/data/models/food_dto.dart';
import 'package:pedala/features/home/data/services/home_api_service.dart';
import 'package:pedala/generated/assets.gen.dart';

abstract class HomeRepository {
  Future<List<FoodCategoryDto>> getCategoryList();
  Future<List<FoodDto>> getAllFood();
  Future<void> craeteOrder({
    required String customerId,
    required String customerName,
    required String customerAddress,
    required String customerNo,
    required String orderStatus,
    required String orderProduct,
    required String total,
    required String customerLong,
    required String customerLat,
    required String riderLong,
    required String riderLat,
    required String riderId,
  });
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeApiService _homeApiService = locator<HomeApiService>();
  @override
  Future<List<FoodCategoryDto>> getCategoryList() async {
    return <FoodCategoryDto>[
      FoodCategoryDto(
        category: 'Jollibee',
        categoryUrl: Assets.images.jollibee.path,
        foods: <FoodDto>[
          FoodDto(
            name: '1pc chickenjoy-solo',
            price: '88',
            imageUrl: Assets.images.chickenjoysolo.path,
          ),
          FoodDto(
            name: '1pc chickenjoy, fries and drinks ',
            price: '123',
            imageUrl: Assets.images.chickenfriesdrinks.path,
          ),
          FoodDto(
            name: '1pc chickenjoy with jollyspaghetti-solo',
            price: '115',
            imageUrl: Assets.images.chickenjoyspag.path,
          ),
          FoodDto(
            name: 'Jolly Spaghetti with Yumburger',
            price: '110',
            imageUrl: Assets.images.spagyamburger.path,
          ),
          FoodDto(
            name: '8pc Burger Steak Family',
            price: '400',
            imageUrl: Assets.images.burgersteakfamily.path,
          ),
        ],
      ),
      FoodCategoryDto(
        category: 'Chowking',
        categoryUrl: Assets.images.chowking.path,
        foods: <FoodDto>[
          FoodDto(
            name: 'Beef Chow fan with Topping & Drink',
            price: '140',
            imageUrl: Assets.images.beefchowfan.path,
          ),
          FoodDto(
            name: 'Chinese Style Fried Chicken Lauriat',
            price: '188',
            imageUrl: Assets.images.chickenlauriat.path,
          ),
          FoodDto(
            name: '1pc Chicken-Style Fried Chicken',
            price: '93',
            imageUrl: Assets.images.chowkingfriedchicken.path,
          ),
          FoodDto(
            name: 'Sweet n Sour Chicken',
            price: '111',
            imageUrl: Assets.images.sweetnsourchicken.path,
          ),
          FoodDto(
            name: 'Wonton Mami',
            price: '69',
            imageUrl: Assets.images.woontonmami.path,
          ),
        ],
      ),
      FoodCategoryDto(
        category: 'Mc Donalds',
        categoryUrl: Assets.images.mcdo.path,
        foods: <FoodDto>[
          FoodDto(
            name: 'McCrispy Chicken Sandwich with Fries',
            price: '120',
            imageUrl: Assets.images.chickensandwichfries.path,
          ),
          FoodDto(
            name: '1pc Chicken McDo with Fries Medium Meal',
            price: '130',
            imageUrl: Assets.images.chickenfries.path,
          ),
          FoodDto(
            name: 'McCrispy Chicken Fillet Ala King with fries Meal',
            price: '113',
            imageUrl: Assets.images.alakingfries.path,
          ),
          FoodDto(
            name: 'McCrispy Chicken Fillet with fries Meal',
            price: '111',
            imageUrl: Assets.images.filletwithfries.path,
          ),
          FoodDto(
            name: 'BFF fries',
            price: '134',
            imageUrl: Assets.images.bfffries.path,
          ),
        ],
      ),
      FoodCategoryDto(
        category: 'Greenwich',
        categoryUrl: Assets.images.greenwich.path,
        foods: <FoodDto>[
          FoodDto(
            name: '9 Overload Duo',
            price: '399',
            imageUrl: Assets.images.overloadduo.path,
          ),
          FoodDto(
            name: 'Dealicious Trio',
            price: '499',
            imageUrl: Assets.images.dealicioustrio.path,
          ),
          FoodDto(
            name: '9 Dealicious Duo',
            price: '349',
            imageUrl: Assets.images.dealiciousduo.path,
          ),
          FoodDto(
            name: '12 Barkada Dealicious Duo',
            price: '599',
            imageUrl: Assets.images.barkadadealiciousduo.path,
          ),
          FoodDto(
            name: 'Lasagna Chicken Combo',
            price: '167',
            imageUrl: Assets.images.lasagnachicken.path,
          ),
          FoodDto(
            name: 'Pizza Loaded Combo E',
            price: '204',
            imageUrl: Assets.images.pizzaloadedcombo.path,
          ),
        ],
      ),
    ];
  }

  @override
  Future<List<FoodDto>> getAllFood() async {
    return <FoodDto>[
      FoodDto(
        name: '1pc chickenjoy-solo',
        price: '88',
        imageUrl: Assets.images.chickenjoysolo.path,
      ),
      FoodDto(
        name: '1pc chickenjoy, fries and drinks ',
        price: '123',
        imageUrl: Assets.images.chickenfriesdrinks.path,
      ),
      FoodDto(
        name: '1pc chickenjoy with jollyspaghetti-solo',
        price: '115',
        imageUrl: Assets.images.chickenjoyspag.path,
      ),
      FoodDto(
        name: 'Jolly Spaghetti with Yumburger',
        price: '110',
        imageUrl: Assets.images.spagyamburger.path,
      ),
      FoodDto(
        name: '8pc Burger Steak Family',
        price: '400',
        imageUrl: Assets.images.burgersteakfamily.path,
      ),
      FoodDto(
        name: 'Beef Chow fan with Topping & Drink',
        price: '140',
        imageUrl: Assets.images.beefchowfan.path,
      ),
      FoodDto(
        name: 'Chinese Style Fried Chicken Lauriat',
        price: '188',
        imageUrl: Assets.images.chickenlauriat.path,
      ),
      FoodDto(
        name: '1pc Chicken-Style Fried Chicken',
        price: '93',
        imageUrl: Assets.images.chowkingfriedchicken.path,
      ),
      FoodDto(
        name: 'Sweet n Sour Chicken',
        price: '111',
        imageUrl: Assets.images.sweetnsourchicken.path,
      ),
      FoodDto(
        name: 'Wonton Mami',
        price: '69',
        imageUrl: Assets.images.woontonmami.path,
      ),
      FoodDto(
        name: 'McCrispy Chicken Sandwich with Fries',
        price: '120',
        imageUrl: Assets.images.chickensandwichfries.path,
      ),
      FoodDto(
        name: '1pc Chicken McDo with Fries Medium Meal ',
        price: '130',
        imageUrl: Assets.images.chickenfries.path,
      ),
      FoodDto(
        name: 'McCrispy Chicken Fillet Ala King with fries Meal',
        price: '113',
        imageUrl: Assets.images.alakingfries.path,
      ),
      FoodDto(
        name: 'McCrispy Chicken Fillet with fries Meal',
        price: '111',
        imageUrl: Assets.images.filletwithfries.path,
      ),
      FoodDto(
        name: 'BFF fries',
        price: '134',
        imageUrl: Assets.images.bfffries.path,
      ),
      FoodDto(
        name: '9 Overload Duo',
        price: '399',
        imageUrl: Assets.images.overloadduo.path,
      ),
      FoodDto(
        name: 'Dealicious Trio',
        price: '499',
        imageUrl: Assets.images.dealicioustrio.path,
      ),
      FoodDto(
        name: '9 Dealicious Duo',
        price: '349',
        imageUrl: Assets.images.dealiciousduo.path,
      ),
      FoodDto(
        name: '12 Barkada Dealicious Duo',
        price: '599',
        imageUrl: Assets.images.barkadadealiciousduo.path,
      ),
      FoodDto(
        name: 'Lasagna Chicken Combo',
        price: '167',
        imageUrl: Assets.images.lasagnachicken.path,
      ),
      FoodDto(
        name: 'Pizza Loaded Combo E',
        price: '204',
        imageUrl: Assets.images.pizzaloadedcombo.path,
      ),
    ];
  }

  @override
  Future<void> craeteOrder({
    required String customerId,
    required String customerName,
    required String customerAddress,
    required String customerNo,
    required String orderStatus,
    required String orderProduct,
    required String total,
    required String customerLong,
    required String customerLat,
    required String riderLong,
    required String riderLat,
    required String riderId,
  }) async {
    await _homeApiService.createOrder(
      customerId: customerId,
      customerName: customerName,
      customerAddress: customerAddress,
      customerNo: customerNo,
      orderStatus: orderStatus,
      orderProduct: orderProduct,
      total: total,
      customerLong: customerLong,
      customerLat: customerLat,
      riderId: riderId,
    );
  }
}
