// ignore_for_file: unused_import, deprecated_member_use

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:emilio/accounts/social.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:emilio/accounts/more.dart";

class Notifications extends StatefulWidget {
  Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                        padding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
                        child: Card(
                          shadowColor: Colors.green[900],
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: FlatButton.icon(
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              icon: Icon(
                                Icons.skip_previous_rounded,
                                size: 31,
                                color: Colors.black,
                              ),
                              label: Text("Back",style: GoogleFonts.robotoCondensed(fontSize: 15,color: Colors.black))),
                        ),
                      ),
                      Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                    child: Card(
                      shadowColor: Colors.green[900],
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FlatButton.icon(
                          onPressed: () {
                            setState(() {
                              Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context)=> More()));
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          icon: Icon(
                            Icons.help,
                            size: 31,
                            color: Colors.black,
                          ),
                          label: Text("About")),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Divider(
                      color: Colors.white,
                      height: 80,
                      )),
                  ),
                ],
              ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/eco.jpeg'),
                            radius: 40,
                            backgroundColor: Colors.green[900],
                          ),
                          SizedBox(width: 20,),
                          Icon(Icons.forward, size: 50, color: Colors.black),
                          SizedBox(width: 20,),
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/mail.png'),
                            radius: 40,
                            backgroundColor: Colors.green[900],
                          )
                        ],
                        ),
                    ),
                  ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 1, 16, 0),
                      child: TextField(
                        decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        icon: Icon(Icons.person,size:30,color: Colors.black),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        focusColor: Colors.red,
                        hintText: "Username",
                        fillColor: Colors.grey[200]),
                                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 1, 16, 0),
                      child: TextField(
                        decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        icon: Icon(Icons.mail,size:30,color: Colors.black),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hoverColor: Colors.red,
                        hintText: "Email",
                        fillColor: Colors.grey[200]),
                  ),
                    ),
                    SizedBox(height: 50),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Card(
                          shadowColor: Colors.green[900],
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: FlatButton.icon(
                              onPressed: () {
                                // setState(() {
                                //   Navigator.pop(context);
                                // });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              icon: Icon(
                                Icons.notifications,
                                size: 31,
                                color: Colors.black,
                              ),
                              label: Text("Get Notifications",style: GoogleFonts.robotoCondensed(fontSize: 15,color: Colors.black))),
                        ),
                      ]
                 ),
            Row(children: [
              Expanded(
                // ignore: unnecessary_new
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                  child: Divider(
                  color: Colors.white,
                  height: 80,
                  )),
              ),
              Text("OR"),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                  child: Divider(
                  color: Colors.white,
                  height: 50,
                  )),
              ),
              ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalIcon(
                      iconSrc: "assets/svg/facebook-main.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/svg/twitter-main.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: "assets/svg/google.svg",
                      press: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text("The following has been created by Emilio",style:GoogleFonts.robotoCondensed(color: Colors.white)),
                    ],
                  ),
                )
        
            ],
          ),
        ),
      ),
    );
  }
}

