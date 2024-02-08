import 'package:get/get.dart';
import 'package:netflix_clone/app/services/user_service.dart';

class RegisterController extends GetxController{
  var obscure = true.obs;
  var username = "".obs;
  var email = "".obs;
  var password = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  void postUser() async{
    try {
      var result = await UserService.postUser(username.value, email.value, password.value);
      Get.toNamed('/login');
    } catch (e) {
      throw Exception(e);
    }
  }
}