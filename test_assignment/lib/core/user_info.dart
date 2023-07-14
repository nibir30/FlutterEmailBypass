import 'package:flutter/cupertino.dart';
// import 'package:medi_bee/core/app_config.dart';
// import 'package:medi_bee/features/authentication/domain/entities/login_response_entity.dart';
import 'package:rxdart/rxdart.dart';

import '../features/logIn/domain/entities/login_response_entity.dart';
import 'data_manager.dart';

class UserInfo {
  String? loginTime;
  String? logoutTime;
  int appStatus = -1;
  String refreshToken = "";
  String authToken = "";
  String name = "";
  String id = "";
  String profileImgUrl = "";
  String faceFeatures = "";
  int tokenValidity = 0;
  String username = "";
  bool isProfileInfoChanged = false;
  BuildContext? context;
  String userBirthDay = "";
  static final _info = UserInfo._internal();
  UserInfo._internal();
  factory UserInfo() {
    return _info;
  }

  Future<void> setUserData(final LoginResponseEntity _response) async {
    userInfo.authToken = _response.token ?? "";
    await dataManager.saveToken(userInfo.authToken);
  }

  bool get isLoggedIn => authToken.isNotEmpty && username.isNotEmpty;

  void clearLogin() {
    dataManager.saveToken("");
    authToken = "";
    username = "";
  }

  Map<String, String> getAuthData() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (userInfo.authToken.isNotEmpty) "AuthenticationToken": userInfo.authToken,
      if (userInfo.authToken.isNotEmpty) "Authorization": "Bearer ${userInfo.authToken}",
      // "timeDifference": "${appConfig.timeZoneOffset}",
      "x-api-version": "1.1"
    };
  }
}

final UserInfo userInfo = UserInfo();
