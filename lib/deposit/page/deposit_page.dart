import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/home/controller/home_controller.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DepositPage extends StatelessWidget {
  DepositPage({
    Key? key,
  }) : super(key: key);

  HomeController homeControl = Get.put(HomeController());
  final String assetName = "assets/images/flash_yellow.svg";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                assetName,
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 20),
              Text(
                "PRIZES. EVERY. SINGLE DAY",
                style: GoogleFonts.titilliumWeb(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),
              SvgPicture.asset(
                assetName,
                width: 30,
                height: 30,
              ),
            ],
          ),
          Obx(
            () => homeControl.loading.value
                ? Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingAnimationWidget.twistingDots(
                          leftDotColor: const Color.fromRGBO(255, 119, 225, 1),
                          rightDotColor: const Color.fromRGBO(255, 237, 71, 1),
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        LoadingAnimationWidget.twistingDots(
                          leftDotColor: const Color.fromRGBO(76, 36, 159, 1),
                          rightDotColor: const Color.fromRGBO(23, 225, 253, 1),
                          size: 30,
                        )
                      ],
                    ),
                  )
                : GradientText(
                    "\$" + homeControl.prizePerDay.value,
                    style: GoogleFonts.titilliumWeb(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                    colors: const [
                      Color.fromRGBO(5, 230, 196, 1),
                      Color.fromRGBO(76, 36, 159, 1),
                      Color.fromRGBO(23, 225, 253, 1),
                      Color.fromRGBO(255, 119, 225, 1),
                      Color.fromRGBO(255, 237, 71, 1),
                    ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => homeControl.loading.value
                  ? Container()
                  : Text(
                      "JOIN DRAW #${homeControl.drawNumber.value}",
                      style: GoogleFonts.titilliumWeb(
                          color: const Color.fromRGBO(153, 133, 209, 1),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Obx(
              () => homeControl.loading.value
                  ? Container()
                  : const SlideCountdownSeparated(
                      duration: Duration(days: 1),
                      infinityCountUp: false,
                      textStyle:
                          TextStyle(color: Color.fromRGBO(235, 91, 230, 1)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Color.fromRGBO(68, 51, 109, 1),
                      ),
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Deposit on",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  // TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Container(
                  width: 150,
                  color: const Color.fromRGBO(65, 48, 103, 1),
                  margin: const EdgeInsets.only(left: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Container(
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/images/polygon.jpeg",
                            width: 20,
                            height: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Polygon",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 50, right: 50, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Amount",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  color: const Color.fromRGBO(65, 48, 103, 1),
                  child: const TextField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(65, 48, 103, 1), width: 2.0),
                      ),
                      hintText: '0.0',
                      hintStyle: TextStyle(color: Colors.white),
                      hintTextDirection: TextDirection.rtl,
                      label: Text(
                        "USDC",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 5),
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(65, 48, 103, 1),
                    border: Border.all(
                        width: 3.0,
                        color: const Color.fromRGBO(65, 48, 103, 1)),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Estimated Fees",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        "\$0.02",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 50, right: 50, top: 10),
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    primary: const Color.fromRGBO(118, 236, 209, 1),
                    onPrimary: const Color.fromRGBO(40, 17, 86, 0.8)),
                onPressed: () async {
                  await launch("https://flutter.dev");

                  // Get.to(() => TodoListPage());
                },
                child: Text(
                  "Connect wallet",
                  style: GoogleFonts.titilliumWeb(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}
