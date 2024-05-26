import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/routes/router_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: Dimensions.font26,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<UserController>(builder: (userController){
        return _userLoggedIn?
        (userController.isLoading?// them !
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: Dimensions.distance20),
          child: Column(
            children: [
              //profile icon
              AppIcon(
                icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.distance15 * 5,
                size: Dimensions.distance30 * 5,
              ),
              SizedBox(
                height: Dimensions.distance30,
              ),
              Expanded(
                  child: SingleChildScrollView(child: Column(
                    children: [
                      //name
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: userController.userModel.name,//thêm null
                        ),
                      ),
                      //phone
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.phone,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: userController.userModel.phone,// thêm null
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.distance20,
                      ),
                      //email
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.email,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: userController.userModel.email,//thêm null
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.distance20,
                      ),
                      //address
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "Hoi An City",
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.distance20,
                      ),
                      //Messages
                      AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message_outlined,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10 * 5 / 2,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "Messages",
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.distance20,
                      ),
                      //logged out
                      GestureDetector(
                        onTap: (){
                          if(Get.find<AuthController>().userLoggedIn()){
                            Get.find<AuthController>().clearSharedData();
                            Get.find<CartController>().clear();
                            Get.find<CartController>().clearCartHistory();
                            Get.offNamed(RouteHelper.getSignInPage());
                          }else{
                            print("you logged out");
                          }

                        },
                        child: AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.logout,
                            backgroundColor: Colors.redAccent,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height10 * 5 / 2,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText: BigText(
                            text: "Logout",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.distance20,
                      ),
                    ],
                  ),
                  ))
            ],
          ),
        ):
        CustomLoader()):
        Container(child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            width: double.maxFinite,
            height: Dimensions.distance20*8,
            margin: EdgeInsets.only(left: Dimensions.distance20, right: Dimensions.distance20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/image/signintocontinue.png"
                    )
                )
            ),
          ),
            GestureDetector(
              onTap: (){
                Get.toNamed(RouteHelper.getSignInPage());
              },
              child: Container(
              
                width: double.maxFinite,
                height: Dimensions.distance20*8,
                margin: EdgeInsets.only(left: Dimensions.distance20, right: Dimensions.distance20),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
              
                ),
                child: Center(child: BigText(text: "Sign in",color: Colors.white,size: Dimensions.font26,)),
              ),
            )
        ],)));
      },),
    );
  }
}
