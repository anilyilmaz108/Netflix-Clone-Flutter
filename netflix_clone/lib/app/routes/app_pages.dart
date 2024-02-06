import 'package:get/get.dart';
import 'package:netflix_clone/app/modules/base/binding/base_binding.dart';
import 'package:netflix_clone/app/modules/base/views/base_view.dart';
import 'package:netflix_clone/app/modules/get_started/binding/get_started_binding.dart';
import 'package:netflix_clone/app/modules/get_started/views/get_started_view.dart';
import 'package:netflix_clone/app/modules/home/binding/home_binding.dart';
import 'package:netflix_clone/app/modules/home/views/home_view.dart';
import 'package:netflix_clone/app/modules/login/binding/login_binding.dart';
import 'package:netflix_clone/app/modules/login/views/login_view.dart';
import 'package:netflix_clone/app/modules/register/binding/register_binding.dart';
import 'package:netflix_clone/app/modules/register/views/register_view.dart';
import 'package:netflix_clone/app/modules/search/binding/search_page_binding.dart';
import 'package:netflix_clone/app/modules/search/views/search_page_view.dart';
import 'package:netflix_clone/app/modules/splash/binding/splash_binding.dart';
import 'package:netflix_clone/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages{
  AppPages._();

  static const INITIAL = Routes.BASE;

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
    GetPage(
        name: _Paths.LOGIN,
        page: () => LoginView(),
        binding: LoginBinding()
    ),
    GetPage(
        name: _Paths.REGISTER,
        page: () => RegisterView(),
        binding: RegisterBinding()
    ),
    GetPage(
        name: _Paths.BASE,
        page: () => BaseView(),
        binding: BaseBinding(),
      children: [
        GetPage(
            name: _Paths.HOME,
            page: () => HomeView(),
            binding: HomeBinding()
        ),
        GetPage(
            name: _Paths.SEARCHPAGE,
            page: () => SearchPageView(),
            binding: SearchPageBinding()
        ),
      ]
    ),

  ];
}