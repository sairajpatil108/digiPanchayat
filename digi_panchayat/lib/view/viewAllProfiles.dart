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
        });
      } else {
        throw Exception('Failed to load villagers');
      }
    } catch (error) {
      print('Error fetching villagers: $error');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Villager List'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: villagers.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Center(
                  child: DataTable(
                    columns: <DataColumn>[
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Address')),
                      DataColumn(label: Text('Gender')),
                      DataColumn(label: Text('Date of Birth')),
                      DataColumn(label: Text('Land Holding')),
                      DataColumn(label: Text('Family ID')),
                      DataColumn(label: Text('Income')),
                    ],
                    rows: villagers
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
    );
  }
}
