import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:my_app/home/service/home_service.dart';
import 'package:my_app/model/prize_distribution_buffer.dart';

class HomeController extends GetxController {
  final Rx<PrizeDistributionBuffer> prizeDistribution =
      PrizeDistributionBuffer().obs;

  var prizePerDay = "".obs;
  var drawNumber = 0.obs;
  var drawTime = Duration().obs;

  var loading = true.obs;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2), () => fetchPrize());
    super.onReady();
  }

  fetchPrize() async {
    var homeService = Get.find<HomeService>(tag: "ethService");
    try {
      prizeDistribution.value = await homeService.getNewestDraw();

      var finalNumber = prizeDistribution.value.prize.toDouble() / 1000000;
      var formattedNumber = NumberFormat.decimalPattern().format(finalNumber);

      prizePerDay.value = formattedNumber;
      drawNumber.value = prizeDistribution.value.drawNumber.toInt();

      drawTime.value = const Duration(days: 1);
      loading.value = false;
    } catch (e) {
      loading.value = true;
    }
  }
}
