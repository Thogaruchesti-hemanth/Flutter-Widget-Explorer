import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Types')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'ListView Examples',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            buildDrawerItem(context, "Basic ListView", BasicListView()),
            buildDrawerItem(context, 'ListView.builder', BuilderListView()),
            buildDrawerItem(context, 'ListView.separated', SeparatedListView()),
            buildDrawerItem(
              context,
              'Horizontal ListView',
              HorizontalListView(),
            ),
            buildDrawerItem(context, 'Custom ListView', CustomListView()),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Select an Option From the Drawer',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget buildDrawerItem(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

//1.Basic ListView
class BasicListView extends StatelessWidget {
  const BasicListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic ListView')),
      body: ListView(
        children: List.generate(
          10,
          (index) => ListTile(title: Text("Item $index")),
        ),
      ),
    );
  }
}

//2. ListView.builder
class BuilderListView extends StatelessWidget {
  const BuilderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView.builder')),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
    );
  }
}

//3.ListView.separated
class SeparatedListView extends StatelessWidget {
  const SeparatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView.separated')),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 15,
      ),
    );
  }
}

//4.Horizontal ListView
class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal ListView')),
      body: Container(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder:
              (context, index) => Container(
                width: 100,
                margin: EdgeInsets.all(8),
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Item $index',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
        ),
      ),
    );
  }
}

//5.Custom ListView
class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom ListView')),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: 10,
          (context, index) => ListTile(
            title: Text('Custom Item $index'),
            leading: Icon(Icons.star),
          ),
        ),
      ),
    );
  }
}
