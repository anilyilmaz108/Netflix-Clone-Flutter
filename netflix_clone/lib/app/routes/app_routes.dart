part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const Get_STARTED = _Paths.GET_STARTED;

}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const GET_STARTED = '/get-started';

}