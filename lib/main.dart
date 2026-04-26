import 'package:flutter/material.dart';
import 'package:tp_mobile/pages/animated.graphics.page.dart';
import 'package:tp_mobile/pages/counter.page.dart';
import 'package:tp_mobile/pages/graphics.page.dart';
import 'package:tp_mobile/pages/home.page.dart';
import 'package:tp_mobile/pages/settings.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP Mobile - DWM ENSET 2026',
      debugShowCheckedModeBanner: false,
      routes: {
        '/settings': (context) => const SettingsPage(),
        '/counter': (context) => const CounterPage(),
        '/graphics': (context) => const GraphicsPage(),
        '/animatedGraphics': (context) => const AnimatedGraphicsPage(),
        '/': (context) => const HomePage(),
      },
      theme: ThemeData(
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 12),
          bodyLarge: TextStyle(fontSize: 22),
        ),
        useMaterial3: true,
      ),
    );
  }
}
