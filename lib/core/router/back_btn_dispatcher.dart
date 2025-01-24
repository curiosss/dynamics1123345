import 'package:flutter/material.dart';

class CustomBackBtnDispathcer extends RootBackButtonDispatcher {
  CustomBackBtnDispathcer();
  // @override
  // void addCallback(ValueGetter<Future<bool>> callback) {
  //   if (!hasCallbacks) {
  //     WidgetsBinding.instance.addObserver(this);
  //   }
  //   super.addCallback(callback);
  // }

  // @override
  // void removeCallback(ValueGetter<Future<bool>> callback) {
  //   super.removeCallback(callback);
  //   if (!hasCallbacks) {
  //     WidgetsBinding.instance.removeObserver(this);
  //   }
  // }

  @override
  Future<bool> didPopRoute() async {
    // return invokeCallback(Future<bool>.value(false));
    return false;
  }
}
