// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Replace with your actual base URL (e.g., http://localhost:3001)
const baseUrl = 'http://localhost:3001';

class VillagerListScreen extends StatefulWidget {
  @override
  _VillagerListScreenState createState() => _VillagerListScreenState();
}

class _VillagerListScreenState extends State<VillagerListScreen> {
  List<Map<String, dynamic>> villagers = [];
  List<Map<String, dynamic>> filteredVillagers = [];

  @override
  void initState() {
    super.initState();
    fetchVillagers();
  }

  Future<void> fetchVillagers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/villagers'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          villagers = List<Map<String, dynamic>>.from(data);
          filteredVillagers = List<Map<String, dynamic>>.from(data);
        });
      } else {
        throw Exception('Failed to load villagers');
      }
    } catch (error) {
      print('Error fetching villagers: $error');
      // Handle error
    }
  }

  void searchByName(String query) {
    setState(() {
      filteredVillagers = villagers.where((villager) {
        final name = villager['name'].toString().toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Villager List'),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 30, 8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                onChanged: searchByName,
                decoration: InputDecoration(
                  hintText: 'Search by name',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onInverseSurface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).colorScheme.onBackground),
              borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Center(
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Address')),
                  DataColumn(label: Text('Gender')),
                  DataColumn(label: Text('Date of Birth')),
                  DataColumn(label: Text('Land Holding')),
                  DataColumn(label: Text('Family ID')),
                  DataColumn(label: Text('Income')),
                ],
                rows: filteredVillagers
                    .map(
                      (villager) => DataRow(cells: <DataCell>[
                        DataCell(Text(villager['id'].toString())),
                        DataCell(Text(villager['name'].toString())),
                        DataCell(Text(villager['address'].toString())),
                        DataCell(Text(villager['gender'].toString())),
                        DataCell(Text(villager['dob'].toString())),
                        DataCell(Text(villager['land_holding'].toString())),
                        DataCell(Text(villager['family_id'].toString())),
                        DataCell(Text(villager['income'].toString())),
                      ]),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
