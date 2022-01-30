// ignore_for_file: deprecated_member_use, avoid_print, prefer_final_fields, unused_import, unused_label, dead_code, unnecessary_import, nullable_type_in_catch_clause

import 'dart:async';
import 'dart:io';

import 'package:emilio/position/position.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../Home.dart';
// import 'package:geolocator/geolocator.dart';

class Post extends StatefulWidget {
  Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  File? image;
  String quantityValue = "high";

  void takePhoto(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    try {
      if (image == null) return;

      final imageTempo = File(image.path);
      setState(() {
        this.image = imageTempo;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

  bool value = false;
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
  final category = TextEditingController();

  // bool valuep = false;
  // void _onRememberMeChanged(bool newValue) => setState(() {
  //       value = newValue;
  //     });

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Center(
                    child: SvgPicture.asset(
                      "assets/svg/login.svg",
                      height: size.height * 0.12,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text("Name",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 4),
                          SizedBox(
                            height: 50,
                            width: 170,
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
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Text("Categories",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 4),
                          SizedBox(
                            height: 50,
                            width: 170,
                            child: TextFormField(
                              autocorrect: true,
                              controller: category,
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
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 4),
                        child: SizedBox(
                          height: 150,
                          width: 160,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4,
                                ),
                                Icon(Icons.location_on,
                                    color: Colors.blueGrey[800], size: 40),
                                Text("Location",
                                    style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        color: Colors.blueGrey[800],
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 15),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: ElevatedButton(
                                    onPressed: locatePosition,
                                    child: Text("Push",
                                        style: GoogleFonts.roboto(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blueGrey[800]),
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
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text("Picture",
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                    child: Stack(children: [
                      SizedBox(
                        height: size.height * 0.25,
                        width: size.width,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.white,
                          child: image != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.file(
                                    image!,
                                    width: 200,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50)),
                                  width: 200,
                                  height: 100,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 80,
                        right: 150,
                        child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: (context),
                                  builder: ((builder) => bottomSheet(context)));
                            },
                            icon: Icon(
                              Icons.camera_alt_rounded,
                              size: 30,
                              color: Colors.blueGrey[800],
                            )),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
                    child: Text("Quantity",
                        style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 4, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                              activeColor: Colors.white,
                              groupValue: quantityValue,
                              value: "High",
                              onChanged: (value) {
                                setState(() {
                                  quantityValue = value.toString();
                                });
                              },
                            ),
                            Text("High",
                                style: GoogleFonts.roboto(
                                    fontSize: 20, color: Colors.white))
                          ],
                        ),
                        SizedBox(width: 70),
                        Column(
                          children: [
                            Radio(
                              activeColor: Colors.white,
                              groupValue: quantityValue,
                              value: "Medium",
                              onChanged: (value) {
                                setState(() {
                                  quantityValue = value.toString();
                                });
                              },
                            ),
                            Text("Medium",
                                style: GoogleFonts.roboto(
                                    fontSize: 20, color: Colors.white))
                          ],
                        ),
                        SizedBox(width: 70),
                        Column(
                          children: [
                            Radio(
                              activeColor: Colors.white,
                              groupValue: quantityValue,
                              value: "Low",
                              onChanged: (value) {
                                setState(() {
                                  quantityValue = value.toString();
                                });
                              },
                            ),
                            Text("Low",
                                style: GoogleFonts.roboto(
                                    fontSize: 20, color: Colors.white))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Card(
                      shadowColor: Colors.green[900],
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FlatButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text("Submit",
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Choose an Image from ",
              style: GoogleFonts.roboto(
                  fontSize: 24, color: Colors.blueGrey[900])),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon:
                      Icon(Icons.camera, color: Colors.blueGrey[900], size: 34),
                  label: Text("Camera",
                      style: GoogleFonts.roboto(
                          fontSize: 24, color: Colors.blueGrey[900]))),
              SizedBox(
                width: 20,
              ),
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon:
                      Icon(Icons.image, color: Colors.blueGrey[900], size: 34),
                  label: Text("Gallery",
                      style: GoogleFonts.roboto(
                          fontSize: 24, color: Colors.blueGrey[900]))),
            ],
          )
        ],
      ),
    );
  }
}
