import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Explore colum Widget")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Basic Column Layout",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Text("Item1"),
                  Text("Item2"),
                  ElevatedButton(onPressed: () {}, child: Text('Click Me')),
                ],
              ),
              Divider(),
              Text(
                "MainAxisAlignment & CrossAxisAlignment",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 200,
                color: Colors.blue.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Aligned left"),
                    Center(child: Text("Centered")),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("Aligned Right"),
                    ),
                  ],
                ),
              ),
              Divider(),
              Text(
                'Expanded & Flexible',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 200,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        child: Center(child: Text('Expanded 1')),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        color: Colors.green,
                        child: Center(child: Text('Flexible 1')),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                        child: Center(child: Text("Expanded 2")),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Text(
                'Nested Columns',
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
                'Scrollable Column',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                height: 200,
                color: Colors.grey.shade200,
                child: SingleChildScrollView(
                  child: Column(
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
      ),
    );
  }
}
