// ignore_for_file: unused_import, deprecated_member_use

import 'package:emilio/Navi.dart';
import 'package:emilio/accounts/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:emilio/accounts/social.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:emilio/accounts/more.dart";
import "package:emilio/settings.dart";

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: SingleChildScrollView(
        child: SafeArea(
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
                          label: Text("Back",
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: 15, color: Colors.black))),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => More()));
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
              Center(
                child: SvgPicture.asset(
                  "assets/svg/login.svg",
                  height: size.height * 0.23,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      // icon: Icon(Icons.person,size:30,color: Colors.black),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      focusColor: Colors.red,
                      prefixIcon: Icon(Icons.mail, color: Colors.blueGrey[900]),
                      hintText: "Email",
                      fillColor: Colors.grey[200]),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 1, 30, 0),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      // icon: Icon(Icons.mail,size:30,color: Colors.black),
                      filled: true,
                      prefixIcon: Icon(Icons.lock, color: Colors.blueGrey[900]),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hoverColor: Colors.red,
                      hintText: "Email",
                      fillColor: Colors.grey[200]),
                ),
              ),
              SizedBox(height: 40),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                loading
                    ? CircularProgressIndicator()
                    : Card(
                        shadowColor: Colors.green[900],
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: FlatButton(
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              if (email.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Email required"),
                                        duration: Duration(milliseconds: 500),
                                        backgroundColor: Colors.red));
                              } else if (password.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Password required"),
                                        duration: Duration(milliseconds: 500),
                                        backgroundColor: Colors.red));
                              } else {
                                User? result = await AuthService().register(
                                    email.text, password.text, context);
                                if (result != null) {
                                  print("success");
                                  print(result.email);
                                }
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      Text("Account logged in successfully "),
                                  backgroundColor: Colors.blue[900],
                                  duration: Duration(milliseconds: 500),
                                ));
                              }
                              setState(() {
                                loading = false;
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Navi()));
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // icon: Icon(
                            //   Icons.create,
                            //   size: 24,
                            //   color: Colors.black,
                            // ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Text("Login",
                                  style: GoogleFonts.robotoCondensed(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            )),
                      ),
              ]),
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
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("The following has been created by Emilio",
                        style:
                            GoogleFonts.robotoCondensed(color: Colors.white)),
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
