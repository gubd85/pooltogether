import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:my_app/home/view/home.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:my_app/splash/controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  final _ = Get.put(SplashController());

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Widget svgFlash = SvgPicture.asset(
    "assets/images/pooltogether-trophy.svg",
    color: Colors.yellow,
    width: 200,
    height: 200,
  );
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: svgFlash,
        splashTransition: SplashTransition.rotationTransition,
        duration: 50,
        backgroundColor: const Color.fromRGBO(40, 17, 86, 0.8),
        nextScreen: HomePage());
  }
}
