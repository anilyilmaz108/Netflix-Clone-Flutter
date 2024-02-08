import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/mylist/controller/mylist_controller.dart';


class MylistView extends GetView<MylistController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() => Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: ListView.builder(
              itemCount: controller.mylistMovies.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Slidable(
                  key: const ValueKey(0),
                  endActionPane:  ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                        onPressed: (context) => Get.toNamed('/detail', arguments: {'id': controller.mylistMovies.toList()[index].id}),
                        backgroundColor: const Color(0xFF7BC043),
                        foregroundColor: Colors.white,
                        icon: Icons.tv,
                        label: 'Details',
                      ),
                      SlidableAction(
                        onPressed: (context)async{
                          controller.deleteMylist(controller.mylistMovies.toList()[index].id!);
                          final snackBar = SnackBar(
                            content: Text('${controller.mylistMovies.toList()[index].title!} deleted.'),
                            backgroundColor: Colors.orange,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        backgroundColor: const Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage('https://image.tmdb.org/t/p/original${controller.mylistMovies.toList()[index].backdrop_path}'),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    title: Text('${controller.mylistMovies.toList()[index].original_title}', style: TextStyle(color: Colors.white70, fontSize: 18),),
                    subtitle: Text('${controller.mylistMovies.toList()[index].overview}', style: TextStyle(color: Colors.white38, fontSize: 16), maxLines: 2,),
                  ),
                );
              },
            ),
          )),
        ),
      ),
    );
  }

}