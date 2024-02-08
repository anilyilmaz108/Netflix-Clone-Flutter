import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:netflix_clone/app/core/constants.dart';

class Environment {
  String getApiURL() {
    if (kReleaseMode) {
      print('Release Mode aktif');
      return Constants.baseurl;
    } else if (kProfileMode) {
      print('Profile Mode aktif');
      return Constants.baseurl;
    } else {
      print('Local Mode aktif');
      return Platform.isIOS ? Constants.baseServerUrlIOS : Constants.baseServerUrl;
    }
  }

}