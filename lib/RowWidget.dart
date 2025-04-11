import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explore Row Widget')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Row Layout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text('Item 1'),
                SizedBox(width: 10),
                Text('Item 2'),
                SizedBox(width: 10),
                ElevatedButton(onPressed: () {}, child: Text("Click Me")),
              ],
            ),
            Divider(),
            Text(
              "MainAxisAlignment & CrossAxisAlignment",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              color: Colors.blue.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text("Left"), Text("center"), Text("Right")],
              ),
            ),
            Divider(),
            Text(
              'Expanded & Flexible',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Center(child: Text('Expanded 1')),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.green,
                      child: Center(child: Text("Flexible 1")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Center(child: Text('Expanded 2')),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Text(
              'Nested Rows',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [Text('A1'), Text('A2')]),
                    Column(children: [Text('B1'), Text('B2')]),
                  ],
                ),
              ],
            ),
            Divider(),
            Text(
              'Scrollable Row',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              color: Colors.grey.shade200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Item ${index + 1}'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
