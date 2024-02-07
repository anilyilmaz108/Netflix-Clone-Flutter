import 'dart:convert';
import 'package:netflix_clone/app/core/api.dart';
import 'package:netflix_clone/app/core/constants.dart';
import 'package:netflix_clone/app/models/casting.dart';
import 'package:netflix_clone/app/models/movie.dart';
import 'package:netflix_clone/app/models/video.dart';

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

  static Future<Movie> getDetails(int id) async {
    var response = await Api().dio.get('/movie/$id?api_key=${Constants.apikey}&language=${Constants.language}');

    var overview = jsonDecode(response.data)["overview"];
    var original_title = jsonDecode(response.data)["original_title"];
    var backdrop_path = jsonDecode(response.data)["backdrop_path"];

    return Movie(
      overview: overview,
      original_title: original_title,
      backdrop_path: backdrop_path
    );
  }

  static Future<List<Casting>> getCasting(int id) async {
    var response = await Api().dio.get(
      '/movie/$id/credits?api_key=${Constants.apikey}'
    );

    var resData = jsonDecode(response.data)["cast"] as List<dynamic>;
    return resData.map((res) {
      return Casting(
        original_name: res["original_name"],
        profile_path: res["profile_path"],
        character: res["character"],
      );
    }).toList();
  }

  static Future<List<Video>> getVideo(int id) async {
    var response = await Api().dio.get(
        '/movie/$id/videos?api_key=${Constants.apikey}'
    );

    var resData = jsonDecode(response.data)["results"] as List<dynamic>;
    return resData.map((res) {
      return Video(
        iso_639_1: res["original_name"],
        iso_3166_1: res["profile_path"],
        name: res["character"],
        key: res["key"],
        site: res["site"],
        size: res["size"],
        type: res["type"],
        official: res["official"],
        published_at: res["published_at"],
        id: res["id"],
      );
    }).toList();
  }


}
