import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.45; //783.2727272727273/320
  static double pageViewContainer = screenHeight / 3.57; //783.2727272727273/220
  static double pageViewTextContainer =
      screenHeight / 6.527272727272727; //783.2727272727273/120

  // dynamic height padding and margin
  static double height10 = screenHeight / 78.33; //783.2727272727273/10
  static double height15 = screenHeight / 52.22; //783.2727272727273/15
  static double height16 = screenHeight / 48.96; //783.2727272727273/16
  static double height20 = screenHeight / 39.17; //783.2727272727273/20
  static double height30 = screenHeight / 26.11; //783.2727272727273/30
  static double height45 = screenHeight / 17.41; //783.2727272727273/45

  // dynamic width padding and margin
  static double width10 = screenHeight / 78.33; //783.2727272727273/10
  static double width15 = screenHeight / 52.22; //783.2727272727273/15
  static double width20 = screenHeight / 39.17; //783.2727272727273/20
  static double width30 = screenHeight / 26.11; //783.2727272727273/30
  static double width45 = screenHeight / 17.41; //783.2727272727273/45

  // dynamic distance padding and margin
  static double distance10 = screenHeight / 78.33; //783.2727272727273/10
  static double distance15 = screenHeight / 52.22; //783.2727272727273/15
  static double distance18 = screenHeight / 43.52; //783.2727272727273/18
  static double distance19 = screenHeight / 41.23; //783.2727272727273/19
  static double distance20 = screenHeight / 39.17; //783.2727272727273/20
  static double distance25 = screenHeight / 31.34; //783.2727272727273/20
  static double distance30 = screenHeight / 26.11; //783.2727272727273/30
  static double distance45 = screenHeight / 17.41; //783.2727272727273/45
  static double distance5 = screenHeight / 156.66; //783.2727272727273/5

  // font size
  static double font10 = screenHeight / 78.33; //783.2727272727273/10
  static double font15 = screenHeight / 52.22; //783.2727272727273/15
  static double font16 = screenHeight / 48.96; //783.2727272727273/16
  static double font20 = screenHeight / 39.12; //783.2727272727273/20
  static double font26 = screenHeight / 30.13; //783.2727272727273/26
  static double font30 = screenHeight / 26.11; //783.2727272727273/30

  // radius
  static double radius10 = screenHeight / 78.33; //783.2727272727273/10
  static double radius15 = screenHeight / 52.22; //783.2727272727273/15
  static double radius20 = screenHeight / 39.17; //783.2727272727273/20
  static double radius30 = screenHeight / 26.11; //783.2727272727273/30

  //Icon Size
  static double iconSize24 = screenHeight/ 32.64; //783.2727272727273/24
  static double iconSize16 = screenHeight/ 48.96; //783.2727272727273/16

  // list view size
  static double listViewImgSize = screenWidth/ 3.25; //390/120
  static double listViewTextContSize = screenWidth/ 3.9; //390/100

  //popular food
  static double popularFoodImageSize = screenHeight/ 2.24; //783.2727272727273/350

  //bottom height
  static double bottomHeightBar = screenHeight/ 6.53; //783.2727272727273/120

  //splash screen dimensions
  static double splashImg = screenHeight/ 3.134; //783.2727272727273/250
}
