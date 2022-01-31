import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: mediaQuery.height,
            width: mediaQuery.width,
            child: Image.asset(
              'assets/images/welcome.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 10,
            bottom: 20,
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey[800],
              child: Icon(Icons.arrow_right,color: Colors.white,size: mediaQuery.width * 0.03),
              radius: 30,
            ),)
        ],
      ),
    );
  }
}
