import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card widget showcase')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('1. Basic Card'),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('This is a simple card !'),
              ),
            ),
            SizedBox(height: 20),
            Text('2.card with Elevated effect'),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Card with elevation and rounded corners!'),
              ),
            ),
            SizedBox(height: 20),
            Text('3.card with image'),
            Card(
              child: Column(
                children: [
                  Image.network('https://picsum.photos/200/300'),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Card with an Image!'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('4.Interactive Card (Tappable)'),
            InkWell(
              onTap:
                  () => ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Card Clicked!'))),
              child: Card(
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Tap this Card!'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('5.Card with listTile'),
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Thogaruchesti Hemanth'),
                subtitle: Text('Software Developer'),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            SizedBox(height: 20),
            Text('6.Card with Buttons'),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('Card with buttons'),
                    subtitle: Text('This card contains buttons at the bottom.'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {}, child: Text('CANCEL')),
                        TextButton(onPressed: () {}, child: Text('OK')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
