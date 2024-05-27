import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart';

const defaultAppWindowTitle = "App window title here";

bool isDesktop = false;

Future<void> setDesktopAppWindowTitle(String appWindowTitle) async {
  if (isDesktop) {
    return windowManager.setTitle(appWindowTitle);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    isDesktop = (Platform.isWindows || Platform.isLinux || Platform.isMacOS);
    if (isDesktop) {
      await WindowManager.instance.waitUntilReadyToShow(
          const WindowOptions(title: defaultAppWindowTitle));
    }
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = const TextScaler.linear(1);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: textScaler),
      child: FluentApp.router(
        title: defaultAppWindowTitle,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        color: Colors.orange,
        theme: FluentThemeData(
          accentColor: Colors.magenta,
        ),
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: child!,
          );
        },
      ),
    );
  }
}
