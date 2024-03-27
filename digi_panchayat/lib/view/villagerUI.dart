import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VillagerListPage extends StatefulWidget {
  @override
  _VillagerListPageState createState() => _VillagerListPageState();
}

class _VillagerListPageState extends State<VillagerListPage> {
  late Future<List<Villager>> _villagersFuture;

  @override
  void initState() {
    super.initState();
    _villagersFuture = fetchVillagers();
  }

  Future<List<Villager>> fetchVillagers() async {
    final response = await http.get(Uri.parse('http://your_api_base_url/villagers'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Villager.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load villagers');
    }
  }

  void _createVillager() {
    // Show alert dialog for creating villager
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Create Villager"),
          content: Text("Are you sure you want to create a new villager?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Perform create operation here
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Villager created successfully'),
                ));
                setState(() {
                  _villagersFuture = fetchVillagers();
                });
              },
              child: Text("Create"),
            ),
          ],
        );
      },
    );
  }

  void _updateVillager(Villager villager) {
    // Show alert dialog for updating villager
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Update Villager"),
          content: Text("Are you sure you want to update this villager?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Perform update operation here
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Villager updated successfully'),
                ));
                setState(() {
                  _villagersFuture = fetchVillagers();
                });
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void _deleteVillager(int id) {
    // Show alert dialog for deleting villager
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Villager"),
          content: Text("Are you sure you want to delete this villager?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Perform delete operation here
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Villager deleted successfully'),
                ));
                setState(() {
                  _villagersFuture = fetchVillagers();
                });
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Villagers'),
      ),
      body: FutureBuilder<List<Villager>>(
        future: _villagersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: VillagerDataTable(villagers: snapshot.data!, onUpdate: _updateVillager, onDelete: _deleteVillager),
                ),
                ElevatedButton(
                  onPressed: _createVillager,
                  child: Text('Create Villager'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class VillagerDataTable extends StatelessWidget {
  final List<Villager> villagers;
  final Function(Villager) onUpdate;
  final Function(int) onDelete;

  const VillagerDataTable({required this.villagers, required this.onUpdate, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Address')),
          DataColumn(label: Text('Gender')),
          DataColumn(label: Text('DOB')),
          DataColumn(label: Text('Land Holding')),
          DataColumn(label: Text('Family ID')),
          DataColumn(label: Text('Income')),
          DataColumn(label: Text('Actions')),
        ],
        rows: villagers.map((villager) {
          return DataRow(cells: [
            DataCell(Text(villager.id.toString())),
            DataCell(Text(villager.name)),
            DataCell(Text(villager.address)),
            DataCell(Text(villager.gender)),
            DataCell(Text(villager.dob)),
            DataCell(Text(villager.landHolding)),
            DataCell(Text(villager.familyId.toString())),
            DataCell(Text(villager.income.toString())),
            DataCell(Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => onUpdate(villager),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => onDelete(villager.id),
                ),
              ],
            )),
          ]);
        }).toList(),
      ),
    );
  }
}

class Villager {
  final int id;
  final String name;
  final String address;
  final String gender;
  final String dob;
  final String landHolding;
  final int familyId;
  final double income;

  Villager({
    required this.id,
    required this.name,
    required this.address,
    required this.gender,
    required this.dob,
    required this.landHolding,
    required this.familyId,
    required this.income,
  });

  factory Villager.fromJson(Map<String, dynamic> json) {
    return Villager(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      gender: json['gender'],
      dob: json['dob'],
      landHolding: json['land_holding'],
      familyId: json['family_id'],
      income: json['income'],
    );
  }
}
