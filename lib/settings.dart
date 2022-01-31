// ignore_for_file: file_names, unused_import

import 'package:emilio/Navi.dart';
import 'package:emilio/accounts/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emilio/accounts/help.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emilio/accounts/Register.dart';
import 'package:emilio/accounts/profile.dart';
import 'package:emilio/accounts/auth.dart';

class Accounts extends StatefulWidget {
  Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 5,
          ),
          Text("Settings",
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 0.2,
              )),
          SizedBox(height: 15),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 50,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                    child: Divider(
                      color: Colors.white,
                      height: 70,
                    )),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                      leading: Icon(Icons.person, color: Colors.blueGrey[800]),
                      title: Text("Profile",
                          style: GoogleFonts.roboto(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.blueGrey[800]),
                      title: Text("Account",
                          style: GoogleFonts.roboto(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register()));
                      },
                      leading:
                          Icon(Icons.account_box, color: Colors.blueGrey[800]),
                      title: Text("Account",
                          style: GoogleFonts.roboto(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Help()));
                        });
                      },
                      leading: Icon(Icons.help_center_rounded,
                          color: Colors.blueGrey[800]),
                      title: Text("Help Center",
                          style: GoogleFonts.roboto(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: ListTile(
                      onTap: ()async {
                        await signOut();
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                                        builder: (context) => Login()));
                        ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:   Text("Logged out successfuly"),
                                        duration: Duration(milliseconds: 500),
                                        backgroundColor: Colors.red));
                      },
                      leading: Icon(Icons.person, color: Colors.blueGrey[800]),
                      title: Text(
                        "Log Out",
                        style: GoogleFonts.roboto(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin:
                              const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: Divider(
                            color: Colors.white,
                            height: 30,
                          )),
                    ),
                  ],
                ),
                Center(
                    child: Column(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        "assets/svg/login.svg",
                        height: 70,
                      ),
                    ),
                    Text("Version",
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 27, color: Colors.white)),
                    SizedBox(height: 2),
                    Text("138.21:1001",
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 13, color: Colors.white)),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
