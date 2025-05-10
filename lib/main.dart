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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

final Map<String, List<Widget>> widgetGroups = {
  'Basic Widgets': [TextWidget(), Row(), Column()],
  'Styling and Theming': [TextField()],
  'Input and Forms': [Container(), Row(), Column()],
  'Navigation and Routing': [TextField()],
  'Layout Widgets': [TextField()],
  'Interactive Widgets': [TextField()],
  'Image and Media': [TextField()],
  'Scolling Widgets': [Image.asset(''), Icon(Icons.star), Text('Example')],
  'Utility widgets': [Image.asset(''), Icon(Icons.star), Text('Example')],
  'Dialogs Widgets': [Image.asset(''), Icon(Icons.star), Text('Example')],
  'Buttons': [Image.asset(''), Icon(Icons.star), Text('Example')],
};

class _HomePageState extends State<HomePage> {
  Widget _currentWidget = ContainerWidget();

  // State for expanded/collapsed groups
  Map<String, bool> expandedState = {};

  @override
  void initState() {
    super.initState();
    // Flatten the grouped widgets into a single list
    widgetGroups.forEach((key, widgets) {
      expandedState[key] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerItems = [];

    // Build the drawer sections with widgets
    widgetGroups.forEach((groupTitle, widgets) {
      drawerItems.add(
        ExpansionTile(
          title: Text(
            groupTitle,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          initiallyExpanded: expandedState[groupTitle] ?? false,
          onExpansionChanged: (expanded) {
            setState(() {
              expandedState[groupTitle] = expanded;
            });
          },
          children:
              widgets.map((widget) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  title: Text(
                    widget.runtimeType.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  leading: Icon(Icons.widgets_outlined, color: Colors.blueGrey),
                  onTap: () {
                    setState(() {
                      _currentWidget = widget;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
        ),
      );
    });

    // Add static options
    drawerItems.addAll([
      ListTile(
        title: Text('Settings'),
        leading: Icon(Icons.settings),
        onTap: () => Navigator.pop(context),
      ),
      ListTile(
        title: Text('About'),
        leading: Icon(Icons.info),
        onTap: () => Navigator.pop(context),
      ),
    ]);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text('Flutter Widget Explorer'),
          centerTitle: true,
        ),
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: Drawer(
          backgroundColor: Colors.grey[100],
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Drawer Header with user info (or logo)
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'Thogaruchesti Hemanth',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text('saihemanth225@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/sample_image.jpg',
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black87, Colors.grey[800]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                ...drawerItems,
              ],
            ),
          ),
        ),
      ),
      body: _currentWidget,
    );
  }
}
