// ignore_for_file: unused_import, deprecated_member_use, avoid_print, avoid_unnecessary_containers

import 'package:emilio/Home.dart';
import 'package:emilio/Navi.dart';
import 'package:emilio/accounts/auth.dart';
import 'package:emilio/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:emilio/accounts/social.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:emilio/accounts/more.dart";
import "package:emilio/accounts/login.dart";
import 'package:firebase_core/firebase_core.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
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
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          icon: Icon(
                            Icons.login,
                            size: 31,
                            color: Colors.black,
                          ),
                          label: Text("Login")),
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
                  "assets/svg/signup.svg",
                  height: size.height * 0.23,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      // icon: Icon(Icons.person,size:30,color: Colors.black),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      focusColor: Colors.red,
                      hintText: "Email",
                      prefixIcon: Icon(Icons.mail,color: Colors.blueGrey[900]),
                      fillColor: Colors.grey[200]),
                  controller: email,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 1, 30, 0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      // icon: Icon(Icons.mail,size:30,color: Colors.black),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hoverColor: Colors.red,
                      hintText: "password",
                      prefixIcon: Icon(Icons.lock,color: Colors.blueGrey[900]),
                      fillColor: Colors.grey[200]),
                  controller: password,
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
                              if (email.text == "") {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("email required"),
                                  backgroundColor: Colors.red,duration: Duration(milliseconds: 500),
                                ));
                              } else if (password.text == "") {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("password required"),
                                  backgroundColor: Colors.red,duration: Duration(milliseconds: 500),
                                ));
                              } else {
                                User? result = await AuthService().register(
                                    email.text, password.text, context);
                                if (result != null) {
                                  print("success");
                                  print(result.email);
                                }
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Account created "),
                                  backgroundColor: Colors.blue[900],duration: Duration(milliseconds: 500),
                                ));
                              }
                              setState(() {
                                loading = false;
                              });
                              setState(() {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Accounts()));
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
                              child: Text("Sign Up",
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
