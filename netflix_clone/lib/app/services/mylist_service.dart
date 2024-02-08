import 'package:dio/dio.dart';
import 'package:netflix_clone/app/core/constants.dart';
import 'package:netflix_clone/app/models/movie.dart';

class MylistService{
  static Future<List<Movie>> getMylist(String id) async {
    final dio = Dio();
    final response = await dio.get('${Constants.baseServerUrl}/favourites?userId=$id');

    return [
      for (final item in response.data) Movie.fromJson(item),
    ];
  }

  static Future<void> deleteMyList(int id) async {
    final dio = Dio();
    final response = await dio.delete('${Constants.baseServerUrl}/favourites/$id?id=int');
  }

  static Future<void> postMylist(Movie movie) async {
    final dio = Dio();
    final response = await dio.post(
        '${Constants.baseServerUrl}/favourites',
        data: {
          'adult': movie.adult,
          'backdrop_path': movie.backdrop_path,
          'id': movie.id,
          'original_title': movie.original_title,
          'overview': movie.overview,
          'poster_path': movie.poster_path,
          'title' : movie.title

        }
    );
  }

}