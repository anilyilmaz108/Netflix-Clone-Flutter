part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const Get_STARTED = _Paths.GET_STARTED;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const BASE = _Paths.BASE;
  static const HOME = _Paths.BASE + _Paths.HOME;
  static const SEARCHPAGE = _Paths.BASE + _Paths.SEARCHPAGE;

}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const GET_STARTED = '/get-started';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const BASE = '/base';
  static const HOME = '/home';
  static const SEARCHPAGE = '/searchpage';

}