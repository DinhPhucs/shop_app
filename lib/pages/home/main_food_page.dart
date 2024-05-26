import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utils/colors.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  @override
  Widget build(BuildContext context) {
    // print("current height is ${MediaQuery.of(context).size.height.toString()}");
    return RefreshIndicator(child: Column(
      children: [
        // showing the header
        Container(
          margin: EdgeInsets.only(
              top: Dimensions.distance45, bottom: Dimensions.distance15),
          padding: EdgeInsets.only(
              left: Dimensions.distance20, right: Dimensions.distance20),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                        text: "Bangladesh",
                        color: AppColors.mainColor,
                        size: Dimensions.font30),
                    Row(
                      children: [
                        SmallText(
                            text: "Narsingdi", color: AppColors.paraColor),
                        Icon(Icons.arrow_drop_down_rounded),
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.distance45,
                    height: Dimensions.distance45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: Dimensions.iconSize24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //showing the body
        Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            )),
      ],
    ),
        onRefresh: _loadResource);
  }
}
