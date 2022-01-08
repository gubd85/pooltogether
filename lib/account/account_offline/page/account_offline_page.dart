import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountOffLinePage extends StatelessWidget {
  const AccountOffLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: double.infinity,
      margin: EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Icon(
            Icons.monetization_on,
            color: const Color.fromRGBO(233, 215, 113, 1),
            size: 50,
          ),
          Icon(
            Icons.savings,
            color: const Color.fromRGBO(221, 108, 198, 1),
            size: 90,
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 18, right: 18),
            child: RichText(
                softWrap: true,
                text: TextSpan(
                    style: GoogleFonts.titilliumWeb(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "\$100 ",
                        style: GoogleFonts.titilliumWeb(
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "gets you a ",
                      ),
                      TextSpan(
                        text: "1 in 67.99 ",
                        style: GoogleFonts.titilliumWeb(
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "change of winning!*",
                      ),
                    ])),
          ),
          Container(
            color: Color.fromRGBO(65, 48, 103, 0.7),
            margin: const EdgeInsets.only(left: 18, right: 18, top: 20),
            padding: EdgeInsets.all(22),
            child: Column(
              children: [
                Text(
                  "Pooltogether is a crypto-powered prize savings protocol.",
                  style: GoogleFonts.titilliumWeb(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "To interect with the protocol. you will need to connect a wallet.",
                  style: GoogleFonts.titilliumWeb(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                      style: GoogleFonts.titilliumWeb(
                        color: Colors.white54,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(text: "Connect to your existing wallet or "),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("on tap text");
                            },
                          text: "learn more about how to use the protocol.",
                          style: GoogleFonts.titilliumWeb(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white),
                        )
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0, right: 5, top: 30),
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          primary: const Color.fromRGBO(118, 236, 209, 1),
                          onPrimary: const Color.fromRGBO(40, 17, 86, 0.8)),
                      onPressed: () {
                        print("I don't know what to do");

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
          )
        ],
      ),
    );
  }
}
