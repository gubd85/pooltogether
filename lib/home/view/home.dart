import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/account/account_offline/page/account_offline_page.dart';
import 'package:my_app/account/account_online/account_online_page.dart';
import 'package:my_app/deposit/page/deposit_page.dart';
import 'package:my_app/prize/page/prize_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  List<String> networkList = ["Selected", "Polygon", "Ethereum"];
  String valuechoose = "Selected";

  final Widget svgFlash = SvgPicture.asset("assets/flash_yellow.svg");
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageIndex = 0;
  final screens = [DepositPage(), PrizePage(), AccountOffLinePage()];

  void onTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(41, 14, 78, 1.0),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(41, 14, 78, 1),
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Image.asset(
            "assets/images/pool-icon.png",
            height: 50,
            width: 50,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: const Color.fromRGBO(41, 14, 78, 1),
          onTap: onTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.savings,
                ),
                label: "Deposit"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.emoji_events,
              ),
              label: "Prize",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Account",
            )
          ]),
      body: screens[pageIndex],
    );
  }
}
