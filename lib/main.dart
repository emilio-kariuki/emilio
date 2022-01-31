// import 'dart:js';

// ignore_for_file: unused_import

import 'package:emilio/position/Post.dart';
import 'package:emilio/position/position.dart';
import 'package:emilio/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Navi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: Welcome(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
