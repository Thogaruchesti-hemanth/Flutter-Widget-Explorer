import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('GridView Demo'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Count'),
              Tab(text: 'Builder'),
              Tab(text: 'Extent'),
              Tab(text: 'Custom'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridViewCountExample(),
            GridViewBuilderExample(),
            GridViewExtentExample(),
            GridViewCustomExample(),
          ],
        ),
      ),
    );
  }
}

class GridViewCountExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      children: List.generate(10, (index) {
        return Container(
          color: Colors.blue,
          child: Center(
            child: Text('Item $index', style: TextStyle(color: Colors.white)),
          ),
        );
      }),
    );
  }
}

class GridViewBuilderExample extends StatelessWidget {
  const GridViewBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.orange,
          child: Center(
            child: Text('Item $index', style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}

class GridViewExtentExample extends StatelessWidget {
  const GridViewExtentExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 100,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      children: List.generate(10, (index) {
        return Container(
          color: Colors.green,
          child: Center(
            child: Text('Item $index', style: TextStyle(color: Colors.white)),
          ),
        );
      }),
    );
  }
}

class GridViewCustomExample extends StatelessWidget {
  const GridViewCustomExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      childrenDelegate: SliverChildListDelegate(
        List.generate(10, (index) {
          return Container(
            color: Colors.purple,
            child: Center(
              child: Text('Item $index', style: TextStyle(color: Colors.white)),
            ),
          );
        }),
      ),
    );
  }
}
