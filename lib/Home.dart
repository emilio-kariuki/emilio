// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import "Post.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // final Post post;
  // ignore: prefer_final_fields
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? newGoogleMapController;

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

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-0.39817471446402214, 36.96075003863469),
    zoom: 14.4746,
  );

  final CameraPosition product = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(0.11688149266607599, 36.39012525821078),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
          new Factory<OneSequenceGestureRecognizer>(
            () => new EagerGestureRecognizer(),
          ),
        ].toSet(),
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        myLocationButtonEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          locatePosition();
        },
        //  is a gesture recognizer that eagerly claims victory in all gesture arenas
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: locatePosition,
        label: Text('Position!'),
        icon: Icon(Icons.maps_home_work_sharp),
      ),
    );
  }

  // ignore: unused_element
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(product));
  }
}
