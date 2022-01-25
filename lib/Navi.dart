import "package:flutter/material.dart";
import 'Accounts.dart';
import 'Post.dart';
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
        backgroundColor: Colors.green[800],
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: Card(
            color: Colors.green[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BottomNavigationBar(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.green[800],
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
                      icon: Icon(Icons.layers), label: "Item"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.upload), label: "Post"),
                  // BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Item"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "Accounts"),
                ],
              ),
            )),
      ),
    );
  }
}
