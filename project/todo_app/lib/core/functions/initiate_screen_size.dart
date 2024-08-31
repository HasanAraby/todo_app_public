import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_key.dart';
import 'package:todo_app/core/constants/screen_size.dart';
import 'package:todo_app/core/services/services.dart';

MyServices myServices = Get.find();
double getWidth(MediaQueryData mediaQueryData) {
  if (mediaQueryData.orientation == Orientation.portrait) {
    myServices.sharedPreferences.setBool(AppKey.isPortrait, true);
    return mediaQueryData.size.width;
  }
  myServices.sharedPreferences.setBool(AppKey.isPortrait, false);
  return mediaQueryData.size.height;
}

double getHeight(MediaQueryData mediaQueryData) {
  if (mediaQueryData.orientation == Orientation.portrait) {
    return mediaQueryData.size.height;
  }
  return mediaQueryData.size.width;
}

intiateScreenSize(MediaQueryData mediaQueryData) {
  screenHeight = getHeight(mediaQueryData);
  screenWidth = getWidth(mediaQueryData);
}

double isPortrait(MediaQueryData mediaQueryData, double tr, double fl) {
  if (mediaQueryData.orientation == Orientation.portrait) {
    return tr;
  }
  return fl;
}
