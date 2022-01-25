// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: SafeArea(
        child: Padding(
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
        ),
    );
  }
}