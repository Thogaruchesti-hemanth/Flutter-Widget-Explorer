import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container Widget Demo")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // Basic container with padding and Margin
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Basic Container",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              // container with box shadow and border
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(10, 10),
                    ),
                  ],
                ),
                child: Text(
                  "container with shadow & border",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              //Container with gradient Background
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.pink],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Container with Gradient",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              //Container with fixed width & height
              Container(
                margin: EdgeInsets.all(16),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Fixed size ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              //Rotated Container with Transform
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                transform: Matrix4.rotationZ(0.3),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Rotated Container",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
