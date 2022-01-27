import 'dart:js';

import 'package:emilio/position/Post.dart';
import 'package:emilio/position/position.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Navi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      initialRoute: '/navi',
      routes: {
        '/navi' : (context) => Navi(),
        '/post' : (context)=> Point(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}
