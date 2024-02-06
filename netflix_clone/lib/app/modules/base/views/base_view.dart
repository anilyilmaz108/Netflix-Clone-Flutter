import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/base/controller/base_controller.dart';
import 'package:netflix_clone/app/modules/home/views/home_view.dart';
import 'package:netflix_clone/app/modules/search/views/search_page_view.dart';

class BaseView extends GetView<BaseController>{
  static List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    SearchPageView(),
    HomeView(),
  ];

  List<String> appbarTitleList = [
    "Home","Search","My List"
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(controller.selectedIndex.value),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,),
            label: "My List",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.white60,
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: Colors.white,
        onTap: controller.onItemTapped,
      ),
      body: _widgetOptions.elementAt(controller.selectedIndex.value),
    ));
  }

  PreferredSizeWidget _buildAppBar(int index) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      leading: Image.asset(
        'assets/images/netflix_logo.png',
        height: 70,
      ),
      title: Text(
        appbarTitleList[index],
        style: TextStyle(
          color: Colors.white70,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () => Get.offAllNamed('/get-started'),
            icon: const Icon(Icons.logout, color: Colors.white60,)
        ),
      ],
    );
  }
}
