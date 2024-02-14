import 'package:digi_panchayat/pages/homepage.dart';
import 'package:digi_panchayat/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => ThemeNotifier(), // Initialize ThemeNotifier
      child: const MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeNotifier.isDarkMode
            ? ThemeData(useMaterial3: true, colorScheme: darkColorScheme)
            : ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        home: const homePage(), // Use correct widget name
      ),
    );
  }
}

class ThemeNotifier extends ChangeNotifier {
  bool isDarkMode = true; // Initial state

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners(); // Notify listeners when theme changes
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const homePage();
  }
}
