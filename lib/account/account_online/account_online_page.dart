import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountOnlinePage extends StatefulWidget {
  AccountOnlinePage({Key? key}) : super(key: key);

  @override
  _AccountOnlinePageState createState() => _AccountOnlinePageState();
}

class _AccountOnlinePageState extends State<AccountOnlinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(156, 72, 186, 0.95),
                  Color.fromRGBO(76, 36, 159, 0.95),
                ],
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TOTAL BALANCE",
                          style: GoogleFonts.titilliumWeb(
                              color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "\$2,817.04",
                          style: GoogleFonts.titilliumWeb(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/pt-illustration-chill.png",
                      width: 40,
                      height: 40,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 45, right: 45),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Column(
                        children: [
                          Text(
                            "1:3.01",
                            style: GoogleFonts.titilliumWeb(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("DAILY ODDS",
                              style: GoogleFonts.titilliumWeb(
                                color: Colors.white70,
                                fontSize: 16,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, left: 35, right: 35),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Column(
                        children: [
                          Text(
                            "1:1.06",
                            style: GoogleFonts.titilliumWeb(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "WEEKLY ODDS*",
                            style: GoogleFonts.titilliumWeb(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                          leading: Text("🎉"),
                          minLeadingWidth: 0,
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white70,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total claimed winnings",
                                style: GoogleFonts.titilliumWeb(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 7, right: 7, top: 2, bottom: 2),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 0.3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  "\$254.00",
                                  style: GoogleFonts.titilliumWeb(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            child: Text(
              "Deposits",
              style: GoogleFonts.titilliumWeb(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color.fromRGBO(76, 36, 159, 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Color.fromRGBO(0, 0, 0, 0.0),
                  child: ListTile(
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/ethereum.png",
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Ethereum",
                              style: GoogleFonts.titilliumWeb(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/pool-icon_v4.png",
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "\$0.00",
                              style: GoogleFonts.titilliumWeb(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
