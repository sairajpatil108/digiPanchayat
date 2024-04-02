import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaxpayerStatisticsWidget extends StatefulWidget {
  @override
  _TaxpayerStatisticsWidgetState createState() =>
      _TaxpayerStatisticsWidgetState();
}

class _TaxpayerStatisticsWidgetState extends State<TaxpayerStatisticsWidget> {
  Map<String, dynamic> statistics = {};

  Future<void> fetchStatistics() async {
    final response =
        await http.get(Uri.parse('http://localhost:3001/taxpayers/statistics'));
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
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height * 0.6,
      color: Theme.of(context).colorScheme.background,
      child: statistics.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                _buildStatisticCard(
                  'Total Taxpayers',
                  statistics['total_taxpayers'].toString(),
                ),
                _buildStatisticCard(
                  'Pending Water Tax',
                  statistics['pending_water_tax'].toString(),
                ),
                _buildStatisticCard(
                  'Pending Property Tax',
                  statistics['pending_property_tax'].toString(),
                ),
                _buildStatisticCard(
                  'Pending Both Taxes',
                  statistics['pending_both_taxes'].toString(),
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
