import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_app/detail/controller/detailcontroler.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);
  final DetailController detailVC = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("fsdfsfds"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Text(Get.arguments["name"]),
          Text(Get.arguments["email"]),
          TextButton(
            onPressed: () {
              detailVC.addCounter();
            },
            child: Obx(() => Text("${detailVC.counter.value}")),
          ),
        ],
      ),
    );
  }
}
