import 'package:flutter/material.dart';

class Inkwellwidget extends StatefulWidget {
  const Inkwellwidget({super.key});

  @override
  State<Inkwellwidget> createState() => _InkwellwidgetState();
}

class _InkwellwidgetState extends State<Inkwellwidget> {
  String _message = "Tap,Double Tap, or Long Press!";
  Color _boxColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("InkWell Examples")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Basic inkwell with onTop
              InkWell(
                onTap: () {
                  setState(() {
                    _message = "you tapped the box!";
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _message,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),

              InkWell(
                onDoubleTap: () {
                  setState(() {
                    _message = "you double-tapped!";
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.green,
                  child: Text(
                    'Double Tap me',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              //Long Press Example
              InkWell(
                onLongPress: () {
                  setState(() {
                    _boxColor =
                        _boxColor == Colors.blue ? Colors.red : Colors.blue;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: _boxColor,
                  child: Text(
                    "Long Press to Change color",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  print("Custom Splash color tapped!");
                },
                splashColor: Colors.orange.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Custom Splash Color',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              //InkWell Inside a Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    print("Card Tapped!");
                  },
                  borderRadius: BorderRadius.circular(10),
                  splashColor: Colors.cyan.withOpacity(0.3),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'InkWell Inside Card',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              //InkWell with an Image
              InkWell(
                onTap: () {
                  print("Image Tapped");
                },
                child: Image.network(
                  "https://picsum.photos/200/200",
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
