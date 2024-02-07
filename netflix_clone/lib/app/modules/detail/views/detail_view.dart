import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/detail/controller/detail_controller.dart';
import 'package:netflix_clone/app/modules/home/components/movie_section_widget.dart';

class DetailView extends GetView<DetailController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Jumbotron && Appbar
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("https://image.tmdb.org/t/p/original${controller.detailMovie.value.backdrop_path}"),
                            fit: BoxFit.fill
                        )
                    ),
                  ),
                  Positioned(
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(Icons.arrow_back, color: Colors.white70, size: 24,),
                      )
                  ),
                  Positioned(
                      right: 8,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite, color: Colors.white70, size: 24,),
                      )
                  )
                ],
              ),
              /// Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${controller.detailMovie.value.original_title}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        //minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.red[600]),
                        elevation: MaterialStateProperty.all(3),
                      ),
                      onPressed: ()async{},
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow, color: Colors.white,),
                          SizedBox(width: 5,),
                          Text("Play", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              /// Overview
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("${controller.detailMovie.value.overview}", style: TextStyle(color: Colors.white60, fontWeight: FontWeight.w500, fontSize: 16),),
              ),
              /// Casting
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: Text("Casting", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 24),),
              ),
              Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: 10,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return ListTile(
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: NetworkImage("https://image.tmdb.org/t/p/original${controller.castingList[index].profile_path}"),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                        title: Text('${controller.castingList[index].character}', style: TextStyle(color: Colors.white70, fontSize: 18),),
                        subtitle: Text('${controller.castingList[index].original_name}', style: TextStyle(color: Colors.white38, fontSize: 16),),
                      );
                    },
                  )
              ),
              /// Similar Movies
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text("Similar Movies", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 24),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      controller.similarMovies.length,
                          (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: MovieSectionWidget(
                              image: "https://image.tmdb.org/t/p/original${controller.similarMovies.toList()[index].backdrop_path}",
                              bgColor: const Color(0xFFFEFBF9),
                              press: () => Get.toNamed('/detail', arguments: {'id': controller.similarMovies.toList()[index].id}, preventDuplicates: false)
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

}