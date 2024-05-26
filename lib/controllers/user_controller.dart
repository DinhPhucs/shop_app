import 'package:food_delivery/models/user_model.dart';
import 'package:get/get.dart';
import '../data/repository/user_repo.dart';
import '../models/response_model.dart';

class UserController extends GetxController implements GetxService{
  final UserRepo userRepo;
  UserController({required this.userRepo});
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  late UserModel _userModel;
  UserModel get userModel => _userModel; // thêm null

  Future<ResponseModel>getUserInfo() async {

    Response response = await userRepo.getUserInfo();
    // print("status code at user controller: " + response.statusCode.toString());
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      _userModel = UserModel.formJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "successfully");
    }else{
      responseModel = ResponseModel(false, response.statusText!);
    }
    // _isLoading = false;
    update();
    return responseModel;
  }
}