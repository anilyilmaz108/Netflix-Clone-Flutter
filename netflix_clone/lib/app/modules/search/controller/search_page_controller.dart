import 'package:get/get.dart';
import 'package:netflix_clone/app/core/constants.dart';
import 'package:netflix_clone/app/models/movie.dart';
import 'package:netflix_clone/app/services/movie_service.dart';

class SearchPageController extends GetxController{
  var searchWord = "".obs;
  var searchMovies = List<Movie>.empty().obs;
  @override
  void onInit() {
    super.onInit();
    ever(searchWord, (value) => print("$value has been changed!!!"));
    getSearchMovies();
  }

  void getSearchMovies() async{
    try {
      var result = await MovieService.getMovies(
          '/search/movie?api_key=${Constants.apikey}&query=${searchWord.value}'
      );
      searchMovies.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }
}