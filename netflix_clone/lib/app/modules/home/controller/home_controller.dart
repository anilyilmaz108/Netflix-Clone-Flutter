import 'dart:math';

import 'package:get/get.dart';
import 'package:netflix_clone/app/core/constants.dart';
import 'package:netflix_clone/app/models/movie.dart';
import 'package:netflix_clone/app/services/movie_service.dart';

class HomeController extends GetxController{
  var trendingMovies = List<Movie>.empty().obs;
  var actionMovies = List<Movie>.empty().obs;
  var adventureMovies = List<Movie>.empty().obs;
  var animationMovies = List<Movie>.empty().obs;
  var comedyMovies = List<Movie>.empty().obs;
  var documentaryMovies = List<Movie>.empty().obs;
  var scienceFictionMovies = List<Movie>.empty().obs;
  var thrillerMovies = List<Movie>.empty().obs;

  Random random = Random();
  var randomNumber = 0.obs;

  @override
  void onInit(){
    super.onInit();
    randomNumber.value = random.nextInt(5);
    getTrendingMovies();
    getActionMovies();
    getAdventureMovies();
    getAnimationMovies();
    getComedyMovies();
    getDocumentaryMovies();
    getScienceFictionMovies();
    getThrillerMovies();
  }

  void getTrendingMovies() async{
    try {
      var result = await MovieService.getMovies(
          '/trending/movie/day?api_key=${Constants.apikey}&language=${Constants.language}'
      );
      trendingMovies.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getActionMovies() async{
    try {
      var result = await MovieService.getMovies(
          '/discover/movie?api_key=${Constants.apikey}&with_genres=28&language=${Constants.language}'
      );
      actionMovies.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getAdventureMovies() async{
    try {
      var result = await MovieService.getMovies(
          '/discover/movie?api_key=${Constants.apikey}&with_genres=12&language=${Constants.language}'
      );
      adventureMovies.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getAnimationMovies() async{
    try {
      var result = await MovieService.getMovies(
          '/discover/movie?api_key=${Constants.apikey}&with_genres=16&language=${Constants.language}'
      );
      animationMovies.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getComedyMovies() async{
    try {
      var result = await MovieService.getMovies(
          '/discover/movie?api_key=${Constants.apikey}&with_genres=35&language=${Constants.language}'
      );
      comedyMovies.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getDocumentaryMovies() async{
    try {
      var result = await MovieService.getMovies(
          '/discover/movie?api_key=${Constants.apikey}&with_genres=99&language=${Constants.language}'
      );
      documentaryMovies.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getScienceFictionMovies() async{
    try {
      var result = await MovieService.getMovies(
          '/discover/movie?api_key=${Constants.apikey}&with_genres=878&language=${Constants.language}'
      );
      scienceFictionMovies.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getThrillerMovies() async{
    try {
      var result = await MovieService.getMovies(
          '/discover/movie?api_key=${Constants.apikey}&with_genres=53&language=${Constants.language}'
      );
      thrillerMovies.value = result;
    } catch (e) {
      throw Exception(e);
    }
  }
}