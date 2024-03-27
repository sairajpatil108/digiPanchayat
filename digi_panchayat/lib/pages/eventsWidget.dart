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
      // Handle errors here (e.g., show a snackbar)
      print(response.body);
    }
  }

  // Function to create a new item
  Future<void> _createItem() async {
    final name = _nameController.text;

    if (name.isEmpty) {
      // Handle empty input
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
      // Handle errors here
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
      // Handle errors here
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
      // Handle errors here
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          // Form for creating new items
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text('Pick Date & Time'),
                            subtitle: Text(
                              '${_selectedDateTime.year}-${_selectedDateTime.month}-${_selectedDateTime.day} ${_selectedDateTime.hour}:${_selectedDateTime.minute}',
                            ),
                            onTap: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: _selectedDateTime,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              if (picked != null) {
                                final TimeOfDay? pickedTime =
                                    await showTimePicker(
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _createItem,
            child: Text('Create Event'),
          ),
          // List of existing items
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  title: Text(item['name']), // Access name property from JSON
                  subtitle: Text(item[
                      'description']), // Access description property from JSON
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Update Item'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    TextField(
                                      controller: TextEditingController(
                                          text: item['name']),
                                      onChanged: (value) {
                                        // Handle text field changes
                                        setState(() {
                                          item['name'] = value;
                                        });
                                      },
                                      decoration:
                                          InputDecoration(labelText: 'Name'),
                                    ),
                                    ListTile(
                                      title: Text('Date & Time'),
                                      subtitle: Text(
                                        '${DateTime.parse(item['description']).year}-${DateTime.parse(item['description']).month}-${DateTime.parse(item['description']).day} ${DateTime.parse(item['description']).hour}:${DateTime.parse(item['description']).minute}',
                                      ),
                                      onTap: () async {
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.parse(
                                              item['description']),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101),
                                        );
                                        if (picked != null) {
                                          final TimeOfDay? pickedTime =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                DateTime.parse(
                                                    item['description'])),
                                          );
                                          if (pickedTime != null) {
                                            setState(() {
                                              item['description'] = DateTime(
                                                picked.year,
                                                picked.month,
                                                picked.day,
                                                pickedTime.hour,
                                                pickedTime.minute,
                                              ).toString();
                                            });
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _updateItem(item['id'], item['name'],
                                          DateTime.parse(item['description']));
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Update'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteItem(
                            item['id']), // Call delete function with item ID
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
