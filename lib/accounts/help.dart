// ignore_for_file: deprecated_member_use

import 'package:emilio/settings.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class Help extends StatefulWidget {
  Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("Help and Support",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 16, color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shadowColor: Colors.green[900],
                  color: Colors.green[900],
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
                        color: Colors.white,
                      ),
                      label: Text("")),
                ),
              )
            ],
          ),
        ));
  }
}
