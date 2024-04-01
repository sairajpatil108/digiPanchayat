// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, use_build_context_synchronously, avoid_print, unused_element

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventsWidget extends StatefulWidget {
  @override
  _EventsWidgetState createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {
  final TextEditingController _nameController = TextEditingController();
  DateTime _selectedDateTime = DateTime.now();
  List<dynamic> _items = [];

  // Fetch items on initial load
  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  // Function to fetch items from the API
  Future<void> _fetchItems() async {
    final response = await http.get(Uri.parse('http://localhost:3001/items'));
    if (response.statusCode == 200) {
      setState(() {
        _items = jsonDecode(response.body);
      });
    } else {
      print(response.body);
    }
  }


  Future<void> _createItem() async {
    final name = _nameController.text;

    if (name.isEmpty) {
      return;
    }

    final response = await http.post(
      Uri.parse('http://localhost:3001/items'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'description': _selectedDateTime.toString(),
      }),
    );

    if (response.statusCode == 201) {
      _nameController.clear();
      _fetchItems(); // Refresh the list after creation
    } else {
      print(response.body);
    }
  }

  Future<void> _deleteItem(int id) async {
    final response = await http.delete(
      Uri.parse('http://localhost:3001/items/$id'),
    );

    if (response.statusCode == 200) {
      _fetchItems(); // Refresh the list after deletion
    } else {
      print(response.body);
    }
  }

  Future<void> _updateItem(int id, String newName, DateTime newDateTime) async {
    final response = await http.put(
      Uri.parse('http://localhost:3001/items/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': newName,
        'description': newDateTime.toString(),
      }),
    );

    if (response.statusCode == 200) {
      _fetchItems(); // Refresh the list after update
    } else {
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).colorScheme.secondaryContainer,
              width: 1.5, 
            )),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.43,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedDateTime,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (picked != null) {
                          final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(_selectedDateTime),
                          );
                          if (pickedTime != null) {
                            setState(() {
                              _selectedDateTime = DateTime(
                                picked.year,
                                picked.month,
                                picked.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );
                            });
                          }
                        }
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: const Text('Pick Date & Time'),
                                subtitle: Text(
                                  '${_selectedDateTime.year}-${_selectedDateTime.month}-${_selectedDateTime.day} ${_selectedDateTime.hour}:${_selectedDateTime.minute}',
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: Icon(
                                Icons.calendar_month,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _createItem,
              child: const Text('Create Event'),
            ),
            // List of existing items
            Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return ListTile(
                      title: Text(item['name']), // Access name property from JSON
                      subtitle: Text(item[
                          'description']), // Access description property from JSON
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteItem(
                            item['id']), // Call delete function with item ID
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
