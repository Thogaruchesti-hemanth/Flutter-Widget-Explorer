import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListTile Exploration')),
      body: ListView(
        children: [
          //Basic ListTile
          ListTile(
            title: Text('Basic ListTile'),
            subtitle: Text('This is a subTitle'),
            leading: Icon(Icons.info),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print('Basic ListTile tapped');
            },
          ),
          SizedBox(height: 10),
          //ListTile with Check
          ListTile(
            title: Text('ListTile with CheckBox'),
            leading: Icon(Icons.check_box_outline_blank),
            trailing: Checkbox(
              value: false,
              onChanged: (bool? value) {
                print('CheckBox Clicked');
              },
            ),
          ),
          SizedBox(height: 10),
          //ListTile with switch
          ListTile(
            title: Text('ListTile with switch'),
            subtitle: Text('Toggle switch on of off'),
            leading: Icon(Icons.toggle_off),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {
                print('Switch toggled');
              },
            ),
          ),
          SizedBox(height: 10),
          //listTile with Custom Styling
          ListTile(
            title: Text(
              'Custom Styled ListTile',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            subtitle: Text('Bold and colored Text'),
            leading: Icon(Icons.style, color: Colors.red),
            trailing: Icon(Icons.star, color: Colors.amber),
            tileColor: Colors.grey[200],
          ),
          SizedBox(height: 10),
          //List with Navigation
          ListTile(
            title: Text('Navigate to new Screen'),
            leading: Icon(Icons.navigate_next),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('You navigated to a new screen!'),
        ),
      ),
    );
  }
}
