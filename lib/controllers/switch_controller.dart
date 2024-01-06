import 'package:get/get.dart';

class SwitchController extends GetxController {
  RxBool isSwitched = false.obs;

  changeSwitchValue(value) {
    isSwitched.value = value;
  }
}
