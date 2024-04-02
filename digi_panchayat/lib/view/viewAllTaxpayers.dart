import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://localhost:3001';

class TaxpayerListScreen extends StatefulWidget {
  @override
  _TaxpayerListScreenState createState() => _TaxpayerListScreenState();
}

class _TaxpayerListScreenState extends State<TaxpayerListScreen> {
  List<Map<String, dynamic>> taxpayers = [];
  List<Map<String, dynamic>> filteredTaxpayers = [];

  @override
  void initState() {
    super.initState();
    fetchTaxpayers();
  }

  Future<void> fetchTaxpayers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/taxpayers'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          taxpayers = List<Map<String, dynamic>>.from(data);
          filteredTaxpayers = List<Map<String, dynamic>>.from(data);
        });
      } else {
        throw Exception('Failed to load taxpayers');
      }
    } catch (error) {
      print('Error fetching taxpayers: $error');
      // Handle error
    }
  }

  void searchByName(String query) {
    setState(() {
      filteredTaxpayers = taxpayers.where((taxpayer) {
        final name = taxpayer['name'].toString().toLowerCase();
        return name.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taxpayer List'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Water Tax')),
                  DataColumn(label: Text('Property Tax')),
                  DataColumn(label: Text('House Number')),
                ],
                rows: filteredTaxpayers
                    .map(
                      (taxpayer) => DataRow(cells: <DataCell>[
                        DataCell(Text(taxpayer['tax_id'].toString())),
                        DataCell(Text(taxpayer['name'].toString())),
                        DataCell(Text(taxpayer['water_tax'].toString())),
                        DataCell(Text(taxpayer['property_tax'].toString())),
                        DataCell(Text(taxpayer['house_number'].toString())),
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
