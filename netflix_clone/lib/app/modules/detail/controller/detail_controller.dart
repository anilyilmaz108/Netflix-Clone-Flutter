import 'package:get/get.dart';
import 'package:netflix_clone/app/core/constants.dart';
import 'package:netflix_clone/app/models/casting.dart';
import 'package:netflix_clone/app/models/movie.dart';
import 'package:netflix_clone/app/services/movie_service.dart';

class DetailController extends GetxController{
  var detailMovie = Movie().obs;
  int getID = Get.arguments['id'] ?? 0;
  var castingList = List<Casting>.empty().obs;
  var similarMovies = List<Movie>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    getDetailMovie();
    getCasting();
    getSimilarMovies();
  }

  void getDetailMovie() async{
    try {
      var result = await MovieService.getDetails(getID);
      detailMovie.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getCasting() async{
    try {
      var result = await MovieService.getCasting(getID);
      castingList.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getSimilarMovies() async{
    try {
      var result = await MovieService.getMovies(
          '/movie/$getID/similar?api_key=${Constants.apikey}&language=${Constants.language}&&sort_by=popularity.desc'
      );
      similarMovies.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

}