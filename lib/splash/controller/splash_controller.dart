import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_app/home/service/home_service.dart';

class SplashController extends GetxController {
  HomeService homeService =
      Get.put(HomeService(), permanent: true, tag: "ethService");
  @override
  void onInit() {
    homeService.initialSetUp();
    super.onInit();
  }
}
