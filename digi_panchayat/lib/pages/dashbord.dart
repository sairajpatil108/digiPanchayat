// ignore_for_file: camel_case_types

import 'package:digi_panchayat/data/events.dart';
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
        Column(
          children: [
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.all(10.0).copyWith(left: 40, right: 40),
                child: const Text("Events"),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height * 0.6,
              color: Theme.of(context).colorScheme.background,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.builder(
                      itemCount: eventData.length,
                      itemBuilder: (context, index) {
                        final event = eventData[index];
                        return Card(
                          color: Theme.of(context).colorScheme.surface,
                          child: ListTile(
                            title: Text(event.eventName),
                            subtitle: Text(event.dateTime),
                            trailing: ElevatedButton(
                                onPressed: () {},
                                child: const Icon(Icons.delete)),
                            // You can add more ListTile customization here
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  _showBottomSheet(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "update",
                    style: TextStyle(fontSize: 16),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}

void _showBottomSheet(BuildContext context) {
  final formKey = GlobalKey<FormState>();

  String eventName = "";
  String dateTime = "";

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Form(
      key: formKey,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Title"),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a title" : null,
                  onSaved: (value) => eventName = value!,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Date and Time"),
                  validator: (value) =>
                      value!.isEmpty ? "Please enter a date and time" : null,
                  onSaved: (value) => dateTime = value!,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      // Create a new Event object
                      final newEvent =
                          Event(eventName: eventName, dateTime: dateTime);
                      // Add the new event to the list
                      eventData.add(newEvent);
                      // Perform any other actions, like saving to a database
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
