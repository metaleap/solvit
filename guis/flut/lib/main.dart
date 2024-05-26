import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

const appWindowTitle = "App window title here";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WindowManager.instance.ensureInitialized();
  await windowManager.setTitle(appWindowTitle);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appWindowTitle,
      home: Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'App nav',
            onPressed: null,
          ),
          title: const Text(appWindowTitle),
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
        body: const Center(
          child: Text('Hello World!'),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.apple), label: "Foo 1", tooltip: "Tooltip1"),
          BottomNavigationBarItem(
              icon: Icon(Icons.window), label: "Foo 2", tooltip: "Tooltip2"),
          BottomNavigationBarItem(
              icon: Icon(Icons.android), label: "Foo 3", tooltip: "Tooltip3"),
        ]),
      ),
    );
  }
}
