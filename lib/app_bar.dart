import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'material_app_widget.dart';

class AppBarExplorer extends StatelessWidget {
  const AppBarExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Bar Explorer',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: AppBarExampleSelector(),
    );
  }
}

class AppBarExampleSelector extends StatelessWidget {
  final List<Map<String, dynamic>> appBarExamples = [
    {'title': 'Default AppBar', 'widget': DefaultAppBarExample()},
    {'title': 'AppBar with Actions', 'widget': ActionsAppBarExample()},
    {
      'title': 'AppBar with FlexibleSpace',
      'widget': FlexibleSpaceAppBarExample(),
    },
    {'title': 'AppBar with TabBar', 'widget': TabBarAppBarExample()},
    {'title': 'SliverAppBar Example', 'widget': SliverAppBarExample()},
    {'title': 'Transparent AppBar', 'widget': TransparentAppBarExample()},
    {'title': 'Themed AppBar', 'widget': ThemedAppBarExample()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appbar Explorer')),
      body: ListView.builder(
        itemCount: appBarExamples.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(appBarExamples[index]['title']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => appBarExamples[index]['widget'],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DefaultAppBarExample extends StatelessWidget {
  const DefaultAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Default AppBar')),
      body: Center(child: Text('This is a simple appbar example.')),
    );
  }
}

class ActionsAppBarExample extends StatelessWidget {
  const ActionsAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar with Actions'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Center(child: Text('Appbar with action buttons.')),
    );
  }
}

class FlexibleSpaceAppBarExample extends StatelessWidget {
  const FlexibleSpaceAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlexibleSpace Appbar'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Center(child: Text('AppBar with grandient flexible space.')),
    );
  }
}

class TabBarAppBarExample extends StatelessWidget {
  const TabBarAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.star), text: 'favorites'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Home Tab')),
            Center(child: Text('Favorites Tab')),
            Center(child: Text('Profile Tab')),
          ],
        ),
      ),
    );
  }
}

class SliverAppBarExample extends StatelessWidget {
  const SliverAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver AppBar'),
              background: Image.network(
                'https://picsum.photos/400/200',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text("Item #$index")),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class TransparentAppBarExample extends StatelessWidget {
  const TransparentAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Transparent AppBar'),
      ),
      body: Stack(
        children: [
          Image.network(
            'https://picsum.photos/500/800',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Text(
              "Content Behind Transparent AppBar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class ThemedAppBarExample extends StatelessWidget {
  const ThemedAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text('Themed AppBar')),
        body: Center(child: Text('Custom themed AppBar')),
      ),
    );
  }
}
