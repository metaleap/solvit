import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

const appWindowTitle = "App window title here";

void main() async {
  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      WidgetsFlutterBinding.ensureInitialized();
      await WindowManager.instance.ensureInitialized();
      await windowManager.setTitle(appWindowTitle);
    }
  }

  runApp(const SolvitMain());
}

class SolvitMain extends StatelessWidget {
  const SolvitMain({super.key});

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        elevation: 44,
        title: const Text(
          appWindowTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
          IconButton(
            icon: const Icon(Icons.auto_delete_rounded),
            tooltip: 'Wot',
            onPressed: () {
              print("Wot!");
            },
          ),
        ],
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: Text('First'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.bookmark_border),
              selectedIcon: Icon(Icons.book),
              label: Text('Second'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.star_border),
              selectedIcon: Icon(Icons.star),
              label: Text('Third'),
            ),
          ], selectedIndex: 0),
          const Center(
            child: Text('Hello World!'),
          ),
        ],
      ),
      drawer: const NavigationDrawer(
        selectedIndex: 0,
        children: <Widget>[
          NavigationDrawerDestination(
            icon: Icon(Icons.inventory_2_outlined),
            selectedIcon: Icon(Icons.inventory_2),
            label: Text("Projects"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              activeIcon: Icon(Icons.inventory_2),
              label: "Projects"),
          BottomNavigationBarItem(
              icon: Icon(Icons.window), label: "Foo 2", tooltip: "Tooltip2"),
          BottomNavigationBarItem(
              icon: Icon(Icons.android), label: "Foo 3", tooltip: "Tooltip3"),
        ],
      ),
    );

    MaterialApp materialApp = MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
        fontFamily: "Yanone Kaffeesatz",
        useMaterial3: true,
      ),
      title: appWindowTitle,
      home: scaffold,
      debugShowCheckedModeBanner: false,
    );

    return materialApp;
  }
}
