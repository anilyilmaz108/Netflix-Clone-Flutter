import 'package:get/get.dart';
import 'package:netflix_clone/app/models/user.dart';
import 'package:netflix_clone/app/services/user_service.dart';

class LoginController extends GetxController{
  var obscure = true.obs;
  var user = User().obs;
  var email = "".obs;
  var username = "".obs;
  var userId = 1.obs;
  var password = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  void getUser() async{
    try {
      var result = await UserService.getUser(email.value,password.value);
      user.value = result;
      username.value = user.value.username!;
      userId.value = user.value.id!;
      if(user.value.username != ""){
        Get.toNamed('/base');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}