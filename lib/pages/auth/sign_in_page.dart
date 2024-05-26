import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/routes/router_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController){
      // var authController = Get.find<AuthController>();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(email.isEmpty){
        showCustomSnackBar("Type in your email address", title: "Email address");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in a valid email address", title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password", title: "Password");
      }else if(password.length<6){
        showCustomSnackBar("Password can not be less than six characters", title: "Password");
      }else{
        // showCustomSnackBar("All went well", title: "prefect");
        // print(signUpBody.toString());
        authController.login(email, password).then((status){
          if(status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
            // Get.toNamed(RouteHelper.getCartPage());
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
       return !authController.isLoading? SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              //app logo
              Container(
                height: Dimensions.screenHeight * 0.20,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Dimensions.distance20 * 4,
                    backgroundImage: AssetImage("assets/image/logo part 1.png"),
                  ),
                ),
              ),
              //welcome
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: Dimensions.distance20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello", style: TextStyle(
                        fontSize: Dimensions.font30*2 + Dimensions.font10,
                        fontWeight: FontWeight.bold
                    ),),
                    Text("Sign into your account", style: TextStyle(
                        fontSize: Dimensions.font20,
                        color: Colors.grey[500]
                      // fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.distance10,
              ),
              //your email
              AppTextField(
                  textEditingController: emailController,
                  hintText: 'email',
                  iconData: Icons.email),
              SizedBox(
                height: Dimensions.distance10,
              ),
              //your password
              AppTextField(
                textEditingController: passwordController,
                hintText: 'password ',
                iconData: Icons.password_sharp, isObscure: true,),
              SizedBox(
                height: Dimensions.distance10,
              ),
              SizedBox(
                height: Dimensions.distance20,
              ),
              //tag line
              Row(
                children: [
                  Expanded(child: Container()),
                  RichText(
                      text: TextSpan(
                          text: "Sing into your account",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20,
                          ))),
                  SizedBox(width: Dimensions.distance20,),
                ],
              ),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              //Sign in

              GestureDetector(
                onTap: (){
                  _login(authController);
                },
                child: Container(
                    width: Dimensions.screenWidth / 2,
                    height: Dimensions.screenHeight / 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor,
                    ),
                    child: Center(
                      child: BigText(
                        text: "Sign in",
                        color: Colors.white,
                        size: Dimensions.font20 + Dimensions.font20 / 2,
                      ),
                    )),
              ),

              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              //sign up options
              RichText(
                  text: TextSpan(
                      text: "Don\'t have an account",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font20,
                      ),
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(), transition: Transition.fade),
                            text: " Create",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.mainBlackColor,
                              fontSize: Dimensions.font20,
                            ))
                      ]
                  )),
            ],
          ),
        ):CustomLoader();
      }),
    );


  }
}
