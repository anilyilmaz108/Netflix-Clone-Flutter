import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/home/components/movie_section_widget.dart';
import 'package:netflix_clone/app/modules/search/controller/search_page_controller.dart';

class SearchPageView extends GetView<SearchPageController>{
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            Get.put(SearchPageController());
            controller.getSearchMovies();
            controller.searchWord.value = _searchController.text;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.search,
                    onChanged: (val){
                      controller.searchWord.value = val;
                    },
                    decoration: InputDecoration(
                      label: Text("Search Movie..."),
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: Colors.redAccent,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                controller.searchWord.value == "" || controller.searchWord.value.isEmpty
                    ? Container()
                    : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            children: List.generate(
                              controller.searchMovies.length,
                                  (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: MovieSectionWidget(
                                    image: "https://image.tmdb.org/t/p/original${controller.searchMovies.toList()[index].backdrop_path}",
                                    bgColor: const Color(0xFFFEFBF9),
                                      press: () => Get.toNamed('/detail', arguments: {'id': controller.searchMovies.toList()[index].id})
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

}
