// ignore_for_file: deprecated_member_use, avoid_print, prefer_final_fields, unused_import, unused_label, dead_code, unnecessary_import

import 'dart:async';

import 'package:emilio/position/position.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Home.dart';
// import 'package:geolocator/geolocator.dart';

class Post extends StatefulWidget {
  Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  GoogleMapController? newGoogleMapController;
  Completer<GoogleMapController> _controller = Completer();

  Position? currentPosition;
  var geoLocator = Geolocator();

  void locatePosition() async {
    // ignore: unused_local_variable
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng ltPosition = LatLng(position.latitude, position.longitude);
    print(ltPosition);

    CameraPosition cameraPosition =
        CameraPosition(target: ltPosition, zoom: 15);
    // ignore: unused_local_variable
    newGoogleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  final CameraPosition initial = CameraPosition(
    target: LatLng(-0.39817471446402214, 36.96075003863469),
    zoom: 14.4746,
  );
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  "assets/svg/login.svg",
                  height: size.height * 0.09,
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 0, 0 ),
                        child: Text("Name", style: GoogleFonts.roboto(fontSize:20,color: Colors.white)),
                      ),
              SizedBox(height: 4),
              SizedBox(
                height: 50,
                width:  170,
                child: TextFormField(
                  autocorrect: true,
                  controller: name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        // icon: Icon(Icons.person,size:30,color: Colors.black),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        focusColor: Colors.red,
                        // prefixIcon: Icon(Icons.mail, color: Colors.blueGrey[900]),
                        // hintText: "Name",
                        fillColor: Colors.grey[200]),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 0, 0 ),
                child: Text("Categories", style: GoogleFonts.roboto(fontSize:20,color: Colors.white)),
              ),
              SizedBox(height: 4),
              SizedBox(
                height: 50,
                width:  170,
                child: TextFormField(
                  autocorrect: true,
                  controller: name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        // icon: Icon(Icons.person,size:30,color: Colors.black),
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        focusColor: Colors.red,
                        // prefixIcon: Icon(Icons.mail, color: Colors.blueGrey[900]),
                        // hintText: "Name",
                        fillColor: Colors.grey[200]),
                ),
              ),
            ],
          ),
          SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,5,0,4),
            child: SizedBox(
              height: 140,
              width: 160,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 4,),
                    Icon(Icons.location_on,color: Colors.blueGrey[800],size: 40),
                    Text("Location", style: GoogleFonts.roboto(fontSize:20,color: Colors.blueGrey[800],fontWeight: FontWeight.bold)),
                    SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Push", style: GoogleFonts.roboto(fontSize:20,color: Colors.white,fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blueGrey[800]),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ],
        ),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0,0,0),
          child: Text("Picture", style: GoogleFonts.roboto(fontSize:20,color: Colors.white,fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
          child: SizedBox(
            height: size.height * 0.25,
            width: size.width,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
            ),
          ),
        )
        ],
      ),
    ));
  }
}
