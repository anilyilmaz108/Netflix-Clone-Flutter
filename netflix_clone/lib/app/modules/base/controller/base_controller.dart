import 'package:get/get.dart';

class BaseController extends GetxController{
  var selectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void onItemTapped(int index) {
  selectedIndex.value = index;
  }
}