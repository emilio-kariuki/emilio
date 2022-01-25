// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emilio/accounts/help.dart';

class Accounts extends StatefulWidget {
  Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 5,
          ),
          Text("Profile",
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 0.2,
              )),
          SizedBox(height: 5),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 40,
            ),
          ),
          Divider(
            thickness: 1,
            height: 50,
            color: Colors.white,
          ),
          Expanded(
            child: ListView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.green[800]),
                      title: Text("Acsounts",
                          style: GoogleFonts.roboto(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.green[800]),
                      title: Text("Acsounts",
                          style: GoogleFonts.roboto(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.green[800]),
                      title: Text("Accounts",
                          style: GoogleFonts.roboto(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Help()));
                        });
                      },
                      leading: Icon(Icons.help_center_rounded,
                          color: Colors.green[800]),
                      title: Text("Help Center",
                          style: GoogleFonts.roboto(fontSize: 20)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.green[800]),
                      title: Text(
                        "Log Out",
                        style: GoogleFonts.roboto(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 50,
                  color: Colors.white,
                ),
                Center(
                    child: Column(
                  children: [
                    Text("Version",
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 27, color: Colors.white)),
                    SizedBox(height: 10),
                    Text("138.21:1001",
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 13, color: Colors.white)),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
