// ignore_for_file: camel_case_types

import 'package:digi_panchayat/data/events.dart';
import 'package:digi_panchayat/pages/taxPage.dart';
import 'package:digi_panchayat/pages/villagersDatabase.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import statement

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
  DateTime? selectedDateTime;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Form(
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
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (selectedDate != null) {
                          final selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              selectedDateTime = DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                                selectedTime.hour,
                                selectedTime.minute,
                              );
                            });
                          }
                        }
                      },
                      child: Text(
                        selectedDateTime == null
                            ? 'Select Date and Time'
                            : 'Selected: ${DateFormat('MM/dd/yyyy HH:mm').format(selectedDateTime!)}',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          if (selectedDateTime != null) {
                            // Create a new Event object
                            final newEvent = Event(
                                eventName: eventName,
                                dateTime: selectedDateTime.toString());
                            // Add the new event to the list
                            eventData.add(newEvent);
                            // Perform any other actions, like saving to a database
                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please select date and time'),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}
