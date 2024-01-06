import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 1.obs;

  incremetCounter() {
    counter.value++; // 'value' because counter is an observable
    print(counter.value);
  }
}
