import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:slide_countdown/slide_countdown.dart';

class PrizePage extends StatefulWidget {
  PrizePage({Key? key}) : super(key: key);

  @override
  _PrizePageState createState() => _PrizePageState();
}

class _PrizePageState extends State<PrizePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Prizes on",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                    width: 150,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(65, 48, 103, 1),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(156, 72, 186, 0.95),
                Color.fromRGBO(76, 36, 159, 0.95),
              ]),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "#80 MONDAY, JAN 4",
                          style: GoogleFonts.titilliumWeb(
                              fontSize: 16,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        SlideCountdownSeparated(
                          duration: Duration(days: 1),
                          infinityCountUp: false,
                          textStyle:
                              TextStyle(color: Color.fromRGBO(235, 91, 230, 1)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            color: Color.fromRGBO(68, 51, 109, 1),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("VIEW PRIZE TIERS",
                                style: GoogleFonts.titilliumWeb(
                                    fontSize: 16,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white70,
                            )
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "\$17,632 ",
                                style: GoogleFonts.titilliumWeb(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              TextSpan(
                                text: "in prizer",
                                style: GoogleFonts.titilliumWeb(
                                  color: Colors.white70,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child:
                        Image.asset("assets/images/pt-illustration-chill.png"))
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Text(
                "Past Draws",
                style: GoogleFonts.titilliumWeb(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: ListView.builder(
                  itemCount: 40,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Color.fromRGBO(52, 23, 98, 1.0),
                      child: ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white70,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "#80 ",
                                    style: GoogleFonts.titilliumWeb(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "MONDAY, JAN 3, 2:00 PM",
                                    style: GoogleFonts.titilliumWeb(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "\$17,632 ",
                                    style: GoogleFonts.titilliumWeb(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "in prizes",
                                    style: GoogleFonts.titilliumWeb(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
