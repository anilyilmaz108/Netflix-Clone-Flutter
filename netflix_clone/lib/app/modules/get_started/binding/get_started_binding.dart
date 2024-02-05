import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/get_started/controller/get_started_controller.dart';

class GetStartedBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<GetStartedController>(
          () => GetStartedController(),
    );
  }

}