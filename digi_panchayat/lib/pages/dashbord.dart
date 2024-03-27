// ignore_for_file: camel_case_types, unused_field

import 'package:digi_panchayat/pages/eventsWidget.dart';
import 'package:digi_panchayat/pages/taxPage.dart';
import 'package:digi_panchayat/pages/villagersDatabase.dart';
import 'package:flutter/material.dart';

class dashbord extends StatefulWidget {
  const dashbord({super.key});

  @override
  State<dashbord> createState() => _dashbordState();
}

class _dashbordState extends State<dashbord> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height * 0.8,
          color: Theme.of(context).colorScheme.background,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size(400, 100)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const villagersDatabasePage()));
                    },
                    child: const Text("Villager's Database")),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size(400, 100)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const taxPage()));
                    },
                    child: const Text("Tax"))
              ],
            ),
          ),
        ),
        EventsWidget(),
      ],
    );
  }
}
