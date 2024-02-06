import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/register/ccontroller/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
          () => RegisterController(),
    );
  }
}