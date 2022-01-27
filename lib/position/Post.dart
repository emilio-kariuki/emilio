// ignore_for_file: deprecated_member_use, avoid_print, prefer_final_fields, unused_import

import 'dart:async';

import 'package:emilio/position/position.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

   void  locatePosition() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: Center(
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.purple,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 1, 30, 1),
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Point(locatePosition())));
                      });
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => Home()));
                    },
                    color: Colors.purple,
                    child: Text("Get location")),
              )),
        ));
  }
}
