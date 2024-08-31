import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_key.dart';
import 'package:todo_app/core/constants/device_type.dart';
import 'package:todo_app/core/functions/get_device_type.dart';
import 'package:todo_app/core/services/services.dart';

MyServices myServices = Get.find();
double getFontSize(double mPor, double mLan, double tPor, double tLan) {
  if (getDeviceType() == MyDeviceType.Mobile) {
    if (myServices.sharedPreferences.getBool(AppKey.isPortrait) == true) {
      return mPor;
    }
    return mLan;
  } else {
    if (myServices.sharedPreferences.getBool(AppKey.isPortrait) == true) {
      return tPor;
    }
    return tLan;
  }
}
