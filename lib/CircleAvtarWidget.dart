import 'package:flutter/material.dart';

class CircleAvtarWidget extends StatelessWidget {
  const CircleAvtarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CircleAvatar Demo')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            //1. Basic CircleAvatar
            Text('1. Basic CircleAvatar'),
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 40,
              child: Text(
                'AB',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            // 2. CircleAvatar with Network Image
            Text('2. CircleAvatar with Network Image'),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 20),
            //3. CircleAvatar with Asset Image
            Text('3. CircleAvatar with Asset Image'),
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            SizedBox(height: 20),
            //4. CircleAvatar with Custom Styling & Border
            Text('4. CircleAvatar with Custom Styling & Border'),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue.shade100,
                child: Icon(Icons.person, size: 40, color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            //5. CircleAvatar with Gradient Background
            Text('5. CircleAvatar with Gradient Background'),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.orange],
                ),
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                child: Icon(Icons.star, size: 40, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),

            //6.Group of CircleAvatars
            Text('6.Group of CircleAvatars'),
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'assets/images/sample_image.jpg',
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/200/300',
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    child: CircleAvatar(
                      radius: 30,
                      child: Text('CD', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            //7. Interactive CircleAvatar
            Text('7. Interactive CircleAvatar'),
            GestureDetector(
              onTap:
                  () => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Avatar Clicked!'))),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green,
                child: Icon(Icons.check, color: Colors.white, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
