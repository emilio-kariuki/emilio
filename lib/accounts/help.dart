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
      appBar: AppBar(
        title: Text("Emilio"),
      ),
      body: Column(
        children: [
          Text("Help and Support",style: GoogleFonts.robotoCondensed(fontSize:10,color: Colors.white)),
        ],
      )
    );
  }
}