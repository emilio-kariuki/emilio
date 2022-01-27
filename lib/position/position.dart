// ignore_for_file: prefer_collection_literals, unnecessary_new, deprecated_member_use, avoid_print, unused_local_variable

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:emilio/position/post.dart';

import '../Home.dart';

class Point extends StatefulWidget {
  // Point(void locatePosition, {Key? key}) : super(key: key);

  @override
  State<Point> createState() => _PointState();
}

class _PointState extends State<Point> {
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

  // ignore: prefer_final_fields
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-0.39817471446402214, 36.96075003863469),
    zoom: 14.4746,
  );

  CameraPosition product = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-0.39817471446402214, 36.96075003863469),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
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
            onMapCreated: (GoogleMapController controller) async {
              _controller.complete(controller);
              goToTheLake();
              final marker = Marker(
              markerId: MarkerId('place_name'),
              position: LatLng(9.669111, 80.014007),
              // icon: BitmapDescriptor.,
              infoWindow: InfoWindow(
                title: 'title',
                snippet: 'address',
              ),
            );

            },
            //  is a gesture recognizer that eagerly claims victory in all gesture arenas
          ),
          Positioned(
            top: 16,
            left: 2,
            child: Padding(
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
                    label: Text("back")),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() async {
            LocationPermission permission =
                await Geolocator.requestPermission();
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
            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

          });
        },
        label: Text('Position!'),
        icon: Icon(Icons.maps_home_work_sharp),
      ),
    );
  }

  // ignore: unused_element
  Future<void> goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(product));
  }
}
