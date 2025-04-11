import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  State<FloatingActionButtonWidget> createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState
    extends State<FloatingActionButtonWidget> {
  bool isExtended = false;
  bool isVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible)
          setState(() {
            isVisible = false;
          });
        else if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!isVisible)
            setState(() {
              isVisible = true;
            });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleExtended() {
    setState(() {
      isExtended = !isExtended;
    });
  }

  void _showFABMenu() {
    showModalBottomSheet(
      context: context,
      builder:
          (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text('Message'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.call),
                title: const Text('Call'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAB All-in-One Demo'),
        actions: [
          IconButton(
            onPressed: _toggleExtended,
            icon: const Icon(Icons.swap_horiz),
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 30,
        itemBuilder:
            (context, index) => ListTile(
              leading: CircleAvatar(child: Text('$index')),
              title: Text('Item $index'),
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child:
            isVisible
                ? isExtended
                    ? FloatingActionButton.extended(
                      key: const ValueKey('extended'),
                      onPressed: _showFABMenu,
                      icon: const Icon(Icons.add),
                      label: const Text('Add Item'),
                      tooltip: 'Add with label',
                      heroTag: 'extendedFAB',
                    )
                    : FloatingActionButton(
                      key: const ValueKey('default'),
                      onPressed: _showFABMenu,
                      child: const Icon(Icons.add),
                      backgroundColor: Colors.teal,
                      tooltip: 'Add',
                      heroTag: 'DefaultFAB',
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    )
                : null,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: null, icon: Icon(Icons.home)),
            IconButton(onPressed: null, icon: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
