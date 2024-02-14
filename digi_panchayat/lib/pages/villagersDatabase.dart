// ignore_for_file: camel_case_types

import 'package:digi_panchayat/data/statisticsOverviewVillagers.dart';
import 'package:flutter/material.dart';

class villagersDatabasePage extends StatefulWidget {
  const villagersDatabasePage({super.key});

  @override
  State<villagersDatabasePage> createState() => _villagersDatabasePageState();
}

class _villagersDatabasePageState extends State<villagersDatabasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        title: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            const Card(
                child: Padding(
              padding: EdgeInsets.all(10.0),
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
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            //   dashbord(),
            Row(
              children: <Widget>[
                Expanded(child: Container()),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: Theme.of(context).colorScheme.background,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize:
                                      MaterialStateProperty.all(const Size(200, 100)),
                                ),
                                onPressed: () {},
                                child: const Text("create villager profile")),
                            const SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize:
                                      MaterialStateProperty.all(const Size(200, 100)),
                                ),
                                onPressed: () {},
                                child: const Text("Update existing profile")),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize:
                                      MaterialStateProperty.all(const Size(200, 100)),
                                ),
                                onPressed: () {},
                                child:const Text("delete profile")),
                            const SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize:
                                      MaterialStateProperty.all(const Size(200, 100)),
                                ),
                                onPressed: () {},
                                child:const Text("land holdings")),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0).copyWith(right: 40),
                        child: const Row(
                          children: [
                            Icon(Icons.analytics),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Stastics"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height * 0.6,
                      color: Theme.of(context).colorScheme.background,
                      child: Padding(
                        padding:const EdgeInsets.all(10.0),
                        child: Card(
                          child: Padding(
                              padding:const EdgeInsets.all(20.0),
                              child: ListView.builder(
                                itemCount: statisticsDataVillagers.length,
                                itemBuilder: (context, index) {
                                  final statistics =
                                      statisticsDataVillagers[index];
                                  return Card(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    child: ListTile(
                                      title: Text(statistics.attribute),
                                      subtitle: Text(statistics.data),
                                      // You can add more ListTile customization here
                                    ),
                                  );
                                },
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
