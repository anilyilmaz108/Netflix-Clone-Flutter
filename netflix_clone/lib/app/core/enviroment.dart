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
      return Platform.isIOS ? 'http://localhost:3000' : 'http://10.0.2.2:3000';
    }
  }

  bool showInDebug() {
    if (kDebugMode) {
      return true;
    } else {
      return false;
    }
  }

  String getUsername() {
    if (kReleaseMode) {
      return '';
    } else {
      return '';
    }
  }

  String getPassword() {
    if (kReleaseMode) {
      return '';
    } else {
      return '';
    }
  }
}