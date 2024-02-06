import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/home/components/movie_section_widget.dart';
import 'package:netflix_clone/app/modules/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Jumbotron
              Obx(() => Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://image.tmdb.org/t/p/original${controller.trendingMovies.toList()[controller.randomNumber.value].backdrop_path}"),
                        fit: BoxFit.fill
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(child: Text("Movies", style: TextStyle(color: Colors.white70, fontSize: 20),), onTap: (){},),
                          //SizedBox(width: 10,),
                          GestureDetector(child: Text("TV Shows", style: TextStyle(color: Colors.white70, fontSize: 20),), onTap: (){},),
                          //SizedBox(width: 10,),
                          GestureDetector(child: Text("My List", style: TextStyle(color: Colors.white70, fontSize: 20),), onTap: (){},),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 8.0),
                            child: Text(
                              "${controller.trendingMovies[controller.randomNumber.value].title}",
                              style: TextStyle(color: Colors.white70, fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 8.0),
                            child: Text(
                                "${controller.trendingMovies[controller.randomNumber.value].overview}",
                              maxLines: 3,
                              style: TextStyle(color: Colors.white70, fontSize: 16),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.add, color: Colors.white70,)),
                                  Text("My List", style: TextStyle(color: Colors.white70, fontSize: 20),)
                                ],
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  //minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 50)),
                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                  elevation: MaterialStateProperty.all(3),
                                ),
                                onPressed: ()async{},
                                child: Row(
                                  children: [
                                    Icon(Icons.play_arrow, color: Colors.black,),
                                    Text("Play", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.info_outline_rounded, color: Colors.white70,)),
                                  Text("Info", style: TextStyle(color: Colors.white70, fontSize: 20),)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
              /// Trending Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text("Trending Movies", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 24),),
              ),
              Obx(() {
                if(controller.trendingMovies.isEmpty){
                  return Center(child: const CircularProgressIndicator());
                }else{
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.trendingMovies.length,
                              (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                image: "https://image.tmdb.org/t/p/original${controller.trendingMovies.toList()[index].backdrop_path}",
                                bgColor: const Color(0xFFFEFBF9),
                                press: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              SizedBox(height: 20,),
              /// Action Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text("Action Movies", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 24),),
              ),
              Obx(() {
                if(controller.actionMovies.isEmpty){
                  return Center(child: const CircularProgressIndicator());
                }else{
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.actionMovies.length,
                              (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                image: "https://image.tmdb.org/t/p/original${controller.actionMovies.toList()[index].backdrop_path}",
                                bgColor: const Color(0xFFFEFBF9),
                                press: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              SizedBox(height: 20,),
              /// Adventure Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text("Adventure Movies", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 24),),
              ),
              Obx(() {
                if(controller.adventureMovies.isEmpty){
                  return Center(child: const CircularProgressIndicator());
                }else{
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.adventureMovies.length,
                              (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                image: "https://image.tmdb.org/t/p/original${controller.adventureMovies.toList()[index].backdrop_path}",
                                bgColor: const Color(0xFFFEFBF9),
                                press: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              SizedBox(height: 20,),
              /// Animation Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text("Animation Movies", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 24),),
              ),
              Obx(() {
                if(controller.animationMovies.isEmpty){
                  return Center(child: const CircularProgressIndicator());
                }else{
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.animationMovies.length,
                              (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                image: "https://image.tmdb.org/t/p/original${controller.animationMovies.toList()[index].backdrop_path}",
                                bgColor: const Color(0xFFFEFBF9),
                                press: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              SizedBox(height: 20,),
              /// Comedy Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text("Comedy Movies", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 24),),
              ),
              Obx(() {
                if(controller.comedyMovies.isEmpty){
                  return Center(child: const CircularProgressIndicator());
                }else{
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.comedyMovies.length,
                              (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                image: "https://image.tmdb.org/t/p/original${controller.comedyMovies.toList()[index].backdrop_path}",
                                bgColor: const Color(0xFFFEFBF9),
                                press: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              SizedBox(height: 20,),
              /// Documentary Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text("Documentary Movies", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 24),),
              ),
              Obx(() {
                if(controller.documentaryMovies.isEmpty){
                  return Center(child: const CircularProgressIndicator());
                }else{
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.documentaryMovies.length,
                              (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                image: "https://image.tmdb.org/t/p/original${controller.documentaryMovies.toList()[index].backdrop_path}",
                                bgColor: const Color(0xFFFEFBF9),
                                press: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              SizedBox(height: 20,),
              /// Science-Fiction Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text("Science-Fiction Movies", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 24),),
              ),
              Obx(() {
                if(controller.scienceFictionMovies.isEmpty){
                  return Center(child: const CircularProgressIndicator());
                }else{
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.scienceFictionMovies.length,
                              (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                image: "https://image.tmdb.org/t/p/original${controller.scienceFictionMovies.toList()[index].backdrop_path}",
                                bgColor: const Color(0xFFFEFBF9),
                                press: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              SizedBox(height: 20,),
              /// Thriller Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text("Thriller Movies", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 24),),
              ),
              Obx(() {
                if(controller.thrillerMovies.isEmpty){
                  return Center(child: const CircularProgressIndicator());
                }else{
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.thrillerMovies.length,
                              (index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: MovieSectionWidget(
                                image: "https://image.tmdb.org/t/p/original${controller.thrillerMovies.toList()[index].backdrop_path}",
                                bgColor: const Color(0xFFFEFBF9),
                                press: () {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

