import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    print("I am printing loading state " + Get.find<AuthController>().isLoading.toString());
    return Center(
      child: Container(
        height: Dimensions.distance20*5,
        width: Dimensions.distance20*5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.distance20*5/2),
          color: AppColors.mainColor
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}