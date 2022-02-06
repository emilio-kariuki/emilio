// ignore_for_file: unused_local_variable, avoid_print, empty_catches, unused_element

import 'package:emilio/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Register user
  Future<User?> register(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message.toString()),
          duration: Duration(milliseconds: 600)));
    } catch (e) {
      print(e);
    }
      }

    Future<User?> login(
        String email, String password, BuildContext context) async {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        return userCredential.user;
      } on FirebaseAuthException catch (e) {
        print(e);
      } catch (e) {
        print(e);
      }
    }

    // FirebaseAuth auth = FirebaseAuth.instance;

      Future<void> _signOut() async {
    await auth.signOut();
  }


    //login user
    // Future<User?> login(String email, String password){

    // }
  }

