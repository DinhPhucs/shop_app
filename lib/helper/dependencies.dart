import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/location_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/data/repository/user_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register SharedPreferences
  Get.lazyPut<SharedPreferences>(() => sharedPreferences);

  // Register ApiClient
  Get.lazyPut<ApiClient>(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find<SharedPreferences>()));

  // Register Repositories
  Get.lazyPut<AuthRepo>(() => AuthRepo(apiClient: Get.find<ApiClient>(), sharedPreferences: Get.find<SharedPreferences>()));
  Get.lazyPut<UserRepo>(() => UserRepo(apiClient: Get.find<ApiClient>()));
  Get.lazyPut<PopularProductRepo>(() => PopularProductRepo(apiClient: Get.find<ApiClient>()));
  Get.lazyPut<RecommendedProductRepo>(() => RecommendedProductRepo(apiClient: Get.find<ApiClient>()));
  Get.lazyPut<CartRepo>(() => CartRepo(sharedPreferences: Get.find<SharedPreferences>()));
  Get.lazyPut<LocationRepo>(() => LocationRepo(apiClient: Get.find<ApiClient>(),sharedPreferences: Get.find<SharedPreferences>()));

  // Register Controllers
  Get.lazyPut<AuthController>(() => AuthController(authRepo: Get.find<AuthRepo>()));
  Get.lazyPut<UserController>(() => UserController(userRepo: Get.find<UserRepo>()));
  Get.lazyPut<PopularProductController>(() => PopularProductController(popularProductRepo: Get.find<PopularProductRepo>()));
  Get.lazyPut<RecommendedProductController>(() => RecommendedProductController(recommendedProductRepo: Get.find<RecommendedProductRepo>()));
  Get.lazyPut<CartController>(() => CartController(cartRepo: Get.find<CartRepo>()));
  Get.lazyPut<LocationController>(() => LocationController(locationRepo: Get.find<LocationRepo>()));
}
