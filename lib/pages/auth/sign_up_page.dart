import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/base/show_custom_snackbar.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/routes/router_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../base/custom_loader.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = ["t.png", "f.png", "g.png"];
    void _registrantion(AuthController authController){
      // var authController = Get.find<AuthController>();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();

      if(name.isEmpty){
        showCustomSnackBar("Type in your name", title: "Name");
      }else if(phone.isEmpty){
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      }else if(email.isEmpty){
        showCustomSnackBar("Type in your email address", title: "Email address");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in a valid email address", title: "Valid email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password", title: "Password");
      }else if(password.length<6){
        showCustomSnackBar("Password can not be less than six characters", title: "Password");
      }else{
        showCustomSnackBar("All went well", title: "prefect");
        SignUpBody signUpBody = SignUpBody(name: name,
            phone: phone, email: email, password: password);
        // print(signUpBody.toString());
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            print("Success registration");
            Get.toNamed(RouteHelper.getInitial());
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController){
        return !_authController.isLoading?SingleChildScrollView(
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
              //your name
              AppTextField(
                  textEditingController: nameController,
                  hintText: 'Name',
                  iconData: Icons.person),
              SizedBox(
                height: Dimensions.distance10,
              ),
              //your phoneNumber
              AppTextField(
                  textEditingController: phoneController,
                  hintText: 'phone',
                  iconData: Icons.phone),
              SizedBox(
                height: Dimensions.distance10 * 2,
              ),
              //sign up button
              GestureDetector(
                onTap: (){
                  _registrantion(_authController);
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
                        text: "Sign Up",
                        color: Colors.white,
                        size: Dimensions.font20 + Dimensions.font20 / 2,
                      ),
                    )),
              ),
              SizedBox(
                height: Dimensions.distance10,
              ),
              //tag line
              RichText(
                  text: TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                      text: "Have an account already?",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font20,
                      ))),
              SizedBox(
                height: Dimensions.screenHeight * 0.05,
              ),
              //sign up options
              RichText(
                  text: TextSpan(
                      text: "Sign up using one of the following methods",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font16,
                      ))),
              Wrap(
                children: List.generate(
                    3,
                        (index) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: Dimensions.radius30,
                        backgroundImage:
                        AssetImage("assets/image/" + signUpImages[index]),
                      ),
                    )),
              )
            ],
          ),
        ):const CustomLoader();
      },),
    );
  }
}
