// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Replace with your actual base URL (e.g., http://localhost:3001)
const baseUrl = 'http://localhost:3001';

class VillagerStatisticsScreen extends StatefulWidget {
  @override
  _VillagerStatisticsScreenState createState() =>
      _VillagerStatisticsScreenState();
}

class _VillagerStatisticsScreenState extends State<VillagerStatisticsScreen> {
  int maleCount = 0;
  int femaleCount = 0;
  int adultCount = 0;

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
        // Calculate counts
        int males = 0;
        int females = 0;
        int adults = 0;
        for (var villager in data) {
          if (villager['gender'] == 'Male') {
            males++;
          } else if (villager['gender'] == 'Female') {
            females++;
          }
          var dob = DateTime.parse(villager['dob'].toString());
          var age = DateTime.now().difference(dob).inDays ~/ 365;
          if (age > 18) {
            adults++;
          }
        }
        setState(() {
          maleCount = males;
          femaleCount = females;
          adultCount = adults;
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
        title: const Text('Villager Statistics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Male Count: $maleCount',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Female Count: $femaleCount',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Adult Count (Age > 18): $adultCount',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

