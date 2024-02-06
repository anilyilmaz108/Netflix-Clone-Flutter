import 'dart:convert';
import 'package:netflix_clone/app/core/api.dart';
import 'package:netflix_clone/app/models/movie.dart';

class MovieService {
  static Future<List<Movie>> getMovies(String path) async {
    var response = await Api().dio.get(path);

    var resData = jsonDecode(response.data)["results"] as List<dynamic>;
    return resData.map((res) {
      return Movie(
          adult: res["adult"],
          backdrop_path: res["backdrop_path"],
          id: res["id"],
          original_language: res["original_language"],
          original_title: res["original_title"],
          overview: res["overview"],
          popularity: res["popularity"],
          poster_path: res["poster_path"],
          release_date: res["release_date"],
          title: res["title"],
          video: res["video"],
          vote_average: res["vote_average"],
          vote_count: res["vote_count"]);
    }).toList();
  }

}
