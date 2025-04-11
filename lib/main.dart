import 'package:flutter/material.dart';
import 'package:widgepractice/AddImage.dart';
import 'package:widgepractice/CardWidget.dart';
import 'package:widgepractice/CircleAvtarWidget.dart';
import 'package:widgepractice/ColumnWidget.dart';
import 'package:widgepractice/InkWellWidget.dart';
import 'package:widgepractice/ListTileWidget.dart';
import 'package:widgepractice/RowWidget.dart';
import 'package:widgepractice/StackWidget.dart';
import 'package:widgepractice/TypesOfButtons.dart';

import 'ContainerWidget.dart';
import 'CustomScrollViewWidget.dart';
import 'DateAndTimePicker.dart';
import 'GridViewWidget.dart';
import 'ListViewWidget.dart';
import 'TextInputWidget.dart';
import 'TextWidget.dart';
import 'app_bar.dart';
import 'floating_action_button.dart';
import 'material_app_widget.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

List<Widget> widgetList = [
  ContainerWidget(),
  TextWidget(),
  Typesofbuttons(),
  AddImage(),
  MaterialAppWidget(),
  AppBarExplorer(),
  FloatingActionButtonWidget(),
];

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _currentWidget = ContainerWidget();
  int _selectedIndex = 0;

  void _onMenuItemSelected(int index) {
    setState(() {
      _currentWidget = widgetList[index];
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Widget Explorer')),
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer Header with user info (or logo)
            UserAccountsDrawerHeader(
              accountName: Text('Thogaruchesti Hemanth'),
              accountEmail: Text('saihemanth225@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/sample_image.jpg'),
              ),
              decoration: BoxDecoration(color: Colors.black87),
            ),
            // Menu Items with Icons and Sections
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  for (int i = 0; i < widgetList.length; i++)
                    ListTile(
                      title: Text(widgetList[i].runtimeType.toString()),
                      leading: Icon(Icons.widgets),
                      selected: _selectedIndex == i,
                      onTap: () {
                        _onMenuItemSelected(i);
                        Navigator.pop(context);
                      },
                    ),
                  Divider(),
                  ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings),
                    selected: _selectedIndex == widgetList.length,
                    onTap: () {
                      // Navigate to settings (you can add the functionality)
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('About'),
                    leading: Icon(Icons.info),
                    selected: _selectedIndex == widgetList.length + 1,
                    onTap: () {
                      // Navigate to about (you can add the functionality)
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _currentWidget,
    );
  }
}
