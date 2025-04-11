import 'package:flutter/material.dart';

class BoxDecorationWidget extends StatelessWidget {
  const BoxDecorationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Container Decoration Demo')),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _buildContainer(
            'Solid Color',
            BoxDecoration(color: Colors.blueAccent),
          ),
          _buildContainer(
            "Gradient Background",
            BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          _buildContainer(
            "Border & Border Radius",
            BoxDecoration(
              color: Colors.greenAccent,
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          _buildContainer(
            "Shadow Effect",
            BoxDecoration(
              color: Colors.redAccent,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(5, 5),
                ),
              ],
            ),
          ),

          _buildContainer(
            "ImageBackground",
            BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://flutter.dev/assets/homepage/carousel/slide_1-bg-455fb9c644da13fc38f0d21bc6a14453a4d1b86c531b84e6a7f07a6b8d5cce79.png",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(String text, BoxDecoration decoration) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      height: 120,
      decoration: decoration,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            backgroundColor: Colors.black38,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
