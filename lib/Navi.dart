import 'package:emilio/Constants/constants.dart';
import "package:flutter/material.dart";
import 'settings.dart';
import 'position/Post.dart';
import 'Home.dart';
import 'item.dart';

class Navi extends StatefulWidget {
  Navi({Key? key}) : super(key: key);

  @override
  State<Navi> createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  int selectedIndex = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ecoville"),
        backgroundColor: kprimaryColor,
      ),
      body: Center(
        child: PageView(
          controller: controller,
          onPageChanged: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          children: [
            Home(),
            Item(),
            Post(),
            Accounts(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: kaccentColor,
        currentIndex: selectedIndex,
        onTap: (newIndex) {
          setState(() {
            controller.animateToPage(newIndex,
                duration: Duration(microseconds: 500),
                curve: Curves.ease);
          });
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.layers,color: Colors.grey), label: "Item"),
          BottomNavigationBarItem(
              icon: Icon(Icons.upload), label: "Post"),
          // BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Item"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
