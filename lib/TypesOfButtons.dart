import 'package:flutter/material.dart';

class Typesofbuttons extends StatelessWidget {
  const Typesofbuttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Buttons Demo")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //Elevated Button
              ElevatedButton(
                onPressed: () {
                  print("Elevated Button Clicked");
                },
                child: Text("Elevated Button"),
              ),
              SizedBox(height: 10),
              //Text Button
              TextButton(
                onPressed: () {
                  print("Text Button Clicked");
                },
                child: Text("Text Button"),
              ),
              SizedBox(height: 10),
              //outlined Button
              OutlinedButton(
                onPressed: () {
                  print("outline button clicked");
                },
                child: Text("OutLine Button"),
              ),
              SizedBox(height: 10),
              //Icon Button
              IconButton(
                onPressed: () {
                  print("Icon button Pressed");
                },
                icon: Icon(Icons.thumb_up, size: 30, color: Colors.blue),
              ),
              SizedBox(height: 10),
              //floating Action Button
              FloatingActionButton(
                onPressed: () {
                  print("Floating action button clicked");
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
              SizedBox(height: 10),
              //ElevatedButton With Custom Styling
              ElevatedButton.icon(
                onPressed: () {
                  print("Elevated Button with icon Clicked");
                },
                label: Text("send"),
                iconAlignment: IconAlignment.end,
                icon: Icon(Icons.send),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
