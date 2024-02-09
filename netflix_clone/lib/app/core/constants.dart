import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;
class Constants{
  static const String baseurl = "https://api.themoviedb.org/3";
  static const String apikey = "08cc33bd5ae3a747598ce2ad84376e66";
  static const String language = "en-US";
  static String baseServerUrl = Platform.isIOS ? "http://localhost:3000" : "http://10.0.2.2:3000";
  static String username = "Anıl Yılmaz";
  static int userId = 1;

}