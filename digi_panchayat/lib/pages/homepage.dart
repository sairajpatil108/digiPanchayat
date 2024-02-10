import 'package:digi_panchayat/pages/dashbord.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          toolbarHeight: MediaQuery.of(context).size.height * 0.15,
          title: Row(
            children: [
              SizedBox(
                width: 60,
              ),
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.villa),
              )),
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
                padding: const EdgeInsets.all(8.0).copyWith(right: 40),
                child: InkWell(
                  onTap: () {},
                  child: const Card(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(Icons.person),
                        Text(
                          "Admin",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.green),
                        ),
                      ],
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            // Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            dashbord(),
          ],
        )
        );
  }
}
