import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/common/default/show_toast.dart';
import 'package:hasad_app/core/constants.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../main.dart';
import 'failure.dart';

bool isNetworkConnected = true;
int networkCode = 1000;
String networkErrorMessage = Constants.isArabic
    ? "حدث خطأ في الاتصال بالانترنت"
    : "An error occurred while connecting to the internet";
String networkSuccessMessage = Constants.isArabic ? "انت الان متصل بالانترنت" : "internet restored";

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future handleNetworkError();
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;
  NetworkInfoImpl(
    this._internetConnectionChecker,
  );
  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;

  @override
  Future handleNetworkError() async {
    if (!await _internetConnectionChecker.hasConnection) {
      return left(Failure(networkCode, networkErrorMessage));
    }
  }
}

void networkErrorDialog() {
  if (isNetworkConnected) {
    isNetworkConnected = false;
  }
  return showSnackbar(
      context: navigatorKey.currentContext,
      text: networkErrorMessage,
      state: ToastStates.ERROR,
      icon: Icons.signal_wifi_connected_no_internet_4_sharp);
}

void networkOnlineDialog() {
  if (!isNetworkConnected) {
    isNetworkConnected = true;
  }
  return showSnackbar(
      context: navigatorKey.currentContext,
      text: networkSuccessMessage,
      state: ToastStates.SUCCESS);
}
