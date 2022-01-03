import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  var counter = 0.obs;

  void addCounter() {
    if (counter.value == 0) {
      Get.snackbar("Thanks", "now let's do it");
    } else {
      // Get.snackbar("Ohhh man", "you are amazing");
    }
    counter.value++;
  }
}
