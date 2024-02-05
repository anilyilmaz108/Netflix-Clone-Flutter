import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/get_started/binding/get_started_binding.dart';
import 'package:netflix_clone/app/modules/get_started/views/get_started_view.dart';
import 'package:netflix_clone/app/modules/splash/binding/splash_binding.dart';
import 'package:netflix_clone/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages{
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: _Paths.SPLASH,
        page: () => SplashView(),
        binding: SplashBinding()
    ),
    GetPage(
        name: _Paths.GET_STARTED,
        page: () => GetStartedView(),
        binding: GetStartedBinding()
    ),
  ];
}