import "package:flutter/material.dart";

class Item extends StatefulWidget {
  Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Emilio post"))
    );
  }
}