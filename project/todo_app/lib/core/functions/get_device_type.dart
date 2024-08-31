import 'package:todo_app/core/constants/device_type.dart';
import 'package:todo_app/core/constants/screen_size.dart';

MyDeviceType getDeviceType() {
  // if (screenWidth! >= 950) return MyDeviceType.Desktop;
  if (screenWidth! >= 600) return MyDeviceType.Tablet;
  return MyDeviceType.Mobile;
}
