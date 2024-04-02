import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VillagerStatisticsWidget extends StatefulWidget {
  @override
  _VillagerStatisticsWidgetState createState() =>
      _VillagerStatisticsWidgetState();
}

class _VillagerStatisticsWidgetState extends State<VillagerStatisticsWidget> {
  Map<String, dynamic> statistics = {};

  Future<void> fetchStatistics() async {
    final response =
        await http.get(Uri.parse('http://localhost:3001/statistics'));
    if (response.statusCode == 200) {
      setState(() {
        statistics = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load statistics');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStatistics();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height * 0.6,
                      color: Theme.of(context).colorScheme.background,
      child: statistics.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                _buildStatisticCard(
                  'Total Villagers',
                  statistics['total_villagers'].toString(),
                ),
                _buildStatisticCard(
                  'Male Villagers',
                  statistics['male_villagers'].toString(),
                ),
                _buildStatisticCard(
                  'Female Villagers',
                  statistics['female_villagers'].toString(),
                ),
                _buildStatisticCard(
                  'Total Families',
                  statistics['total_families'].toString(),
                ),
              ],
            ),
    );
  }

  Widget _buildStatisticCard(String title, String value) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title),
        trailing: Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
