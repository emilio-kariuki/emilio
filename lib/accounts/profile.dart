// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_null_comparison, dead_code, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // late File imageFile;
  File? image;

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

  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: SafeArea(
        child: Column(
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
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 15, color: Colors.black))),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Divider(
                        color: Colors.white,
                        height: 20,
                      )),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  imageProfile(context),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
              child: Text("Name",
                  style: GoogleFonts.roboto(fontSize: 27, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 8, 0),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    // icon: Icon(Icons.mail,size:30,color: Colors.black),
                    filled: true,
                    prefixIcon: Icon(Icons.person, color: Colors.blueGrey[900]),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hoverColor: Colors.red,
                    hintText: "Name",
                    fillColor: Colors.grey[200]),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
              child: Text("Email",
                  style: GoogleFonts.roboto(fontSize: 27, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 8, 0),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    // icon: Icon(Icons.mail,size:30,color: Colors.black),
                    filled: true,
                    prefixIcon: Icon(Icons.lock, color: Colors.blueGrey[900]),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hoverColor: Colors.red,
                    hintText: "Email",
                    fillColor: Colors.grey[200]),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
              child: Text("Phone Number",
                  style: GoogleFonts.roboto(fontSize: 27, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 8, 0),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    // icon: Icon(Icons.mail,size:30,color: Colors.black),
                    filled: true,
                    prefixIcon: Icon(Icons.phone, color: Colors.blueGrey[900]),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hoverColor: Colors.red,
                    hintText: "Phone Number",
                    fillColor: Colors.grey[200]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageProfile(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          child: image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    image!,
                    width: 200,
                    height: 100,
                    fit: BoxFit.fitHeight,
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
          radius: 50,
        ),
        Positioned(
            bottom: 14,
            right: 2,
            child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: (context),
                      builder: ((builder) => bottomSheet(context)));
                },
                child: Icon(Icons.camera_alt, color: Colors.white, size: 30))),
      ],
    );
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
