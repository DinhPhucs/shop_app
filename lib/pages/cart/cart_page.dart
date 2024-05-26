import 'package:flutter/material.dart';
import 'package:food_delivery/base/no_data_page.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/location_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../routes/router_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key); // Fixed constructor declaration

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.distance20 * 3,
            right: Dimensions.distance20,
            left: Dimensions.distance20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(
                  width: Dimensions.distance20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                // SizedBox(width: Dimensions.distance20*5,),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                )
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartControler){
            return _cartControler.getItems.length>0?Positioned(
                top: Dimensions.distance20 * 5,
                right: Dimensions.distance20,
                left: Dimensions.distance20,
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(top: Dimensions.distance15),
                  // color: Colors.red,
                  child: MediaQuery.removeViewPadding(
                    context: context,
                    removeTop: true,
                    child: GetBuilder<CartController>(
                      builder: (cartController) {
                        var _cartList = cartController.getItems;
                        return ListView.builder(
                            itemCount: _cartList.length,
                            itemBuilder: (_, index) {
                              return Container(
                                height: Dimensions.distance20 * 5,
                                width: double.maxFinite,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        var popularIndex =
                                        Get.find<PopularProductController>()
                                            .popularProductList
                                            .indexOf(
                                            _cartList[index].product!);
                                        if (popularIndex >= 0) {
                                          Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cartPage"));
                                        } else {
                                          var recommendedIndex =
                                          Get.find<RecommendedProductController>()
                                              .recommendedProductList
                                              .indexOf(
                                              _cartList[index].product!);
                                          if(recommendedIndex<0){
                                            Get.snackbar(
                                                "History Product", "The review is not available for history products",
                                                backgroundColor: AppColors.mainColor, colorText: Colors.white);
                                          }else{
                                            Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cartPage"));
                                          }
                                        }
                                      },
                                      child: Container(
                                        width: Dimensions.distance20 * 5,
                                        height: Dimensions.distance20 * 5,
                                        margin: EdgeInsets.only(
                                            bottom: Dimensions.distance10),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    AppConstants.BASE_URL +
                                                        AppConstants.UPLOAD_URL +
                                                        cartController
                                                            .getItems[index]
                                                            .img!)),
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20),
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.distance10,
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: Dimensions.distance20 * 5,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              BigText(
                                                text: cartController
                                                    .getItems[index].name!,
                                                color: Colors.black54,
                                              ),
                                              SmallText(
                                                text: "Spicy",
                                                color: Colors.black38,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  BigText(
                                                    text: cartController
                                                        .getItems[index].price
                                                        .toString(),
                                                    color: Colors.redAccent,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: Dimensions.distance10,
                                                        bottom: Dimensions.distance10,
                                                        left: Dimensions.distance10,
                                                        right: Dimensions.distance10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius20),
                                                      color: Colors.white70,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                  _cartList[index]
                                                                      .product!,
                                                                  -1);
                                                              print("being tapped");
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              color:
                                                              AppColors.signColor,
                                                            )),
                                                        SizedBox(
                                                          width:
                                                          Dimensions.width10 / 2,
                                                        ),
                                                        BigText(
                                                            text: _cartList[index]
                                                                .quantity
                                                                .toString()),
                                                        //popularProduct.inCartItems.toString()),
                                                        SizedBox(
                                                          width:
                                                          Dimensions.width10 / 2,
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                  _cartList[index]
                                                                      .product!,
                                                                  1);
                                                              print("being tapped");
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color:
                                                              AppColors.signColor,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                  ),
                )):NoDataPage(text: "You cart is empty");
          })
        ],
      ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (cartController) {
            return Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(
                  top: Dimensions.distance30,
                  bottom: Dimensions.distance30,
                  left: Dimensions.distance20,
                  right: Dimensions.distance20),
              decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20 * 2),
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                  )),
              child: cartController.getItems.length>0?Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.distance15,
                        bottom: Dimensions.distance15,
                        left: Dimensions.distance20,
                        right: Dimensions.distance20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white70,
                    ),
                    child: Row(
                      children: [

                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                        BigText(text: "\$ "+cartController.totalItems.toString()),
                        SizedBox(
                          width: Dimensions.width10 / 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.distance15,
                        bottom: Dimensions.distance15,
                        left: Dimensions.distance20,
                        right: Dimensions.distance20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // popularProduct.addItem(product);
                        if(Get.find<AuthController>().userLoggedIn()){
                          print("Logged in?");
                          if(Get.find<LocationController>().addressList.isEmpty){
                            Get.toNamed(RouteHelper.getAddressPage());
                          }
                          // print("tapped");
                          // cartController.addToHistory();
                        }else{
                          Get.toNamed(RouteHelper.getSignInPage());
                        }
                      },
                      child: BigText(
                        text: "Check out",
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ):Container(),
            );
          },
        )
    );
  }
}
