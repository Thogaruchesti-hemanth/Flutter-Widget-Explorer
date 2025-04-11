import 'package:flutter/material.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => StackWidgetState();
}

class StackWidgetState extends State<StackWidget> {
  double xOffset = 0;
  double yOffset = 0;
  bool showOverlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack Widget Exploration')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text('Basic Stack Example', style: _textStyle()),
            basicStack(),
            SizedBox(height: 20),
            Text('Stack with Positioned', style: _textStyle()),
            positionedStack(),
            SizedBox(height: 20),
            Text('Profile Card with Badge', style: _textStyle()),
            profileCard(),
            SizedBox(height: 20),
            Text('Image Background with Overlay', style: _textStyle()),
            imageOverlayStack(),
            SizedBox(height: 20),
            Text('Animated Stack', style: _textStyle()),
            animatedStack(),
            SizedBox(height: 20),
            Text("Draggable Stack", style: _textStyle()),
            draggableStack(),
            SizedBox(height: 20),
            Text('Stack in GridView', style: _textStyle()),
            gridViewStack(),
            Text('Clipped Stack', style: _textStyle()),
            clippedStack(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

TextStyle _textStyle() => TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

Widget basicStack() {
  return Center(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(width: 200, height: 200, color: Colors.red),
        Container(width: 150, height: 150, color: Colors.green),
        Container(width: 100, height: 100, color: Colors.blue),
      ],
    ),
  );
}

Widget positionedStack() {
  return Container(
    height: 250,
    width: double.infinity,
    color: Colors.grey.shade200,
    child: Stack(
      children: [
        Positioned(
          top: 20,
          left: 30,
          child: Container(width: 100, height: 100, color: Colors.orange),
        ),
        Positioned(
          bottom: 20,
          left: 30,
          child: Container(width: 100, height: 100, color: Colors.purple),
        ),
        Positioned(
          top: 70,
          left: 120,
          child: Container(width: 100, height: 100, color: Colors.teal),
        ),
      ],
    ),
  );
}

Widget profileCard() {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        margin: EdgeInsets.only(top: 40),
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
        ),
      ),
      CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage('assets/images/sample_image.jpg'),
      ),
      Positioned(
        top: 80,
        child: Column(
          children: [
            Text(
              "john Doe",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text('Flutter Developer', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
      Positioned(
        top: 52,
        right: 110,
        child: GestureDetector(
          onTap: () => print('Badge Clicked'),
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.red,
            child: Icon(Icons.notifications, color: Colors.white, size: 16),
          ),
        ),
      ),
    ],
  );
}

Widget imageOverlayStack() {
  return Stack(
    children: [
      Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sample_image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        height: 250,
        width: double.infinity,
        color: Colors.black.withOpacity(0.5),
      ),
      Positioned(
        bottom: 30,
        left: 20,
        child: Text(
          'Beautiful Nature',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      Positioned(
        bottom: 30,
        right: 20,
        child: FloatingActionButton(
          onPressed: () => print("Button Clicked!"),
          backgroundColor: Colors.orange,
          child: Icon(Icons.play_arrow),
        ),
      ),
    ],
  );
}

Widget animatedStack() {
  return AnimatedContainer(
    duration: Duration(seconds: 30),
    curve: Curves.easeInOut,
    width: 200,
    height: 200,
    color: Colors.blue,
  );
}

Widget draggableStack() {
  return Draggable(
    feedback: Container(width: 100, height: 100, color: Colors.green),
    childWhenDragging: Container(width: 100, height: 100, color: Colors.grey),
    child: Container(width: 100, height: 100, color: Colors.red),
  );
}

Widget gridViewStack() {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: 6,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (context, index) {
      return Stack(
        children: [
          Container(color: Colors.teal, margin: EdgeInsets.all(10)),
          Positioned(child: Icon(Icons.star, color: Colors.white)),
        ],
      );
    },
  );
}

Widget clippedStack() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Stack(
      children: [
        Container(width: 200, height: 200, color: Colors.orange),
        Positioned(
          bottom: 20,
          right: 20,
          child: Icon(Icons.favorite, color: Colors.white, size: 40),
        ),
      ],
    ),
  );
}
