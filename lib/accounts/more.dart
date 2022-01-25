// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class More extends StatefulWidget {
  More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          style: GoogleFonts.roboto(
                              fontSize: 15, color: Colors.black))),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 8.0, right: 10.0),
                        child: Divider(
                          color: Colors.white,
                          height: 20,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/eco.jpeg'),
                radius: 40,
              ),
              SizedBox(
                height: 5,
              ),
              Text("EcoVille OverView",
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/svg/tree.svg",
                      height: 10,
                      width: 10,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                     padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/svg/garbage.svg",
                      height: 10,
                      width: 10,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                     padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/svg/whale.svg",
                      height: 10,
                      width: 10,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                     padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.white,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/svg/plant.svg",
                      height: 10,
                      width: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text("Project Overview",
                style: GoogleFonts.roboto(
                  fontSize: 25, color: Colors.white)),
              SizedBox(height: 10,),
              Text("This article will look at how to add Google Maps into",
                style: GoogleFonts.roboto(
                  fontSize: 15, color: Colors.white)),
              Text("and the features and customization available.",
                style: GoogleFonts.roboto(
                  fontSize: 15, color: Colors.white)),
              Text("At the time of writing, this plugin is still in ",
                style: GoogleFonts.roboto(
                  fontSize: 15, color: Colors.white)),
                  SizedBox(height: 10,),
              Text(" preview and may have breaking changes in the future.",
                style: GoogleFonts.roboto(
                  fontSize: 15, color: Colors.white)),
              Text("I will try my best to update the article whenever",
                style: GoogleFonts.roboto(
                  fontSize: 15, color: Colors.white)),
              SizedBox(height: 10,),
              Text("This article will look at how to add Google Maps into",
                style: GoogleFonts.roboto(
                  fontSize: 15, color: Colors.white)),
              Text("and the features and customization available.",
                style: GoogleFonts.roboto(
                  fontSize: 15, color: Colors.white)),
              Text("At the time of writing, this plugin is still in ",
                style: GoogleFonts.roboto(
                  fontSize: 15, color: Colors.white)),
              SizedBox(height: 10,),
              Text("This article will look at how to add Google Maps into",
                style: GoogleFonts.roboto(
                  fontSize: 15, color: Colors.white)),
              Text("and the features and customization available.",
                style: GoogleFonts.roboto(
                  fontSize: 15, color: Colors.white)),
              Text("At the time of writing, this plugin is still in ",
                style: GoogleFonts.roboto(
                  fontSize: 15, color: Colors.white)),
              SizedBox(height: 10,),
              Text("Security",
                style: GoogleFonts.roboto(
                  fontSize: 25, color: Colors.white)),
              SizedBox(height: 10,),
              Text("This article will look at how to add Google Maps into a Flutter project and the features and customization available. At the time of writing, this plugin is still in developer preview and may have breaking changes in the future. I will try my best to update the article whenever required. ",
                style: GoogleFonts.roboto(
                  fontSize: 15, color: Colors.white)),
            ],
          )),
    ));
  }
}
