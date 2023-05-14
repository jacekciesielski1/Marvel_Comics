import 'package:flutter/material.dart';
import 'package:marvel_comics/widgets/comics_card.dart';

class HomeScreen extends StatelessWidget {
  // home page that displays slider with comics about Hulk(cause he's cool)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          "Marvel Comics",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: buildSlider(context, "Hulk")),
        ],
      ),
    );
  }
}
