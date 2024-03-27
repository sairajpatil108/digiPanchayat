// ignore_for_file: camel_case_types

import 'package:digi_panchayat/main.dart';
import 'package:digi_panchayat/view/adminButton.dart';
import 'package:digi_panchayat/view/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        title: Row(
          children: [
            const SizedBox(width: 60),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.villa),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "DigiPanchayat",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent.withOpacity(0.5),
                ),
                onPressed: themeNotifier.toggleTheme,
                child: Row(
                  children: [
                    const Text("toggle theme"),
                    Padding(
                      padding: const EdgeInsets.all(3.0).copyWith(left: 10),
                      child: Icon(
                        themeNotifier.isDarkMode
                            ? Icons.dark_mode_rounded
                            : Icons.light_mode_rounded,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const adminButton()
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          const dashbord(),
        ],
      ),
    );
  }
}
