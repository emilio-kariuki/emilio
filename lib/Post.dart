// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

class Post extends StatefulWidget {
  Post({Key? key}) : super(key: key);


  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.purple,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 1, 30, 1),
            child: FlatButton
            (
              onPressed: () {},
                color: Colors.purple,
                child: Text("Get location")),
          )),
    ));
  }
}