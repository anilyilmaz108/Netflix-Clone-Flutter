import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/detail/controller/detail_controller.dart';

class DetailBinding extends Bindings{
@override
void dependencies() {
  Get.lazyPut<DetailController>(
        () => DetailController(),
  );
}
}