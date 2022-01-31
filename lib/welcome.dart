import 'package:emilio/Navi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              'assets/welcome.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 10,
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Navi()));
                });
              },
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey[800],
                child: Icon(Icons.arrow_right,
                    color: Colors.white, size: mediaQuery.width * 0.13),
                radius: 30,
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 130,
            child: Text("EcoVille", style: GoogleFonts.roboto(fontSize: 40,color: Colors.white)),
            )
        ],
      ),
    );
  }
}
