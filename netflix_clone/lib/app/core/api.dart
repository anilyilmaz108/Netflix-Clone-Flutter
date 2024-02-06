import 'package:dio/dio.dart';
import 'package:netflix_clone/app/core/constants.dart';

class Api{
  final dio = createDio();
  Api._internal();
  static final _singleton = Api._internal();
  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseurl,
        responseType: ResponseType.plain,
      ),
    );
    return dio;
  }
}
