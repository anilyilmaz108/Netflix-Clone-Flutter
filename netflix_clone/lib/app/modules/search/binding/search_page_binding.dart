import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/search/controller/search_page_controller.dart';

class SearchPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SearchPageController>(
          () => SearchPageController(),
    );
  }
}