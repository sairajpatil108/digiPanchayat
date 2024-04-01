import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Replace with your actual base URL (e.g., http://localhost:3001)
const baseUrl = 'http://localhost:3001';

class UpdateTaxpayerScreen extends StatefulWidget {
  final int taxpayerId;

  const UpdateTaxpayerScreen({
    required this.taxpayerId,
  });

  @override
  _UpdateTaxpayerScreenState createState() => _UpdateTaxpayerScreenState();
}

class _UpdateTaxpayerScreenState extends State<UpdateTaxpayerScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers for form fields
  final nameController = TextEditingController();
  final waterTaxController = TextEditingController();
  final propertyTaxController = TextEditingController();
  final houseNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchTaxpayerDetails();
  }

  Future<void> fetchTaxpayerDetails() async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/taxpayers/${widget.taxpayerId}'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          nameController.text = data['name'].toString();
          waterTaxController.text = data['water_tax'].toString();
          propertyTaxController.text = data['property_tax'].toString();
          houseNumberController.text = data['house_number'].toString();
        });
      } else {
        throw Exception('Failed to load taxpayer details');
      }
    } catch (error) {
      print('Error fetching taxpayer details: $error');
      // Handle error
    }
  }

  Future<http.Response> updateTaxpayer(
      String name, bool waterTax, bool propertyTax, int houseNumber) async {
    final response = await http.put(
      Uri.parse('$baseUrl/taxpayers/${widget.taxpayerId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'water_tax': waterTax,
        'property_tax': propertyTax,
        'house_number': houseNumber,
      }),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update taxpayer');
    }
  }

  void handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text;
      bool waterTax = waterTaxController.text == 'true' ? true : false;
      bool propertyTax = propertyTaxController.text == 'true' ? true : false;
      int houseNumber = int.parse(houseNumberController.text);

      try {
        await updateTaxpayer(name, waterTax, propertyTax, houseNumber);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Taxpayer updated successfully!'),
          ),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating taxpayer: $error'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Taxpayer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondaryContainer),
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a name' : null,
                    ),
                    TextFormField(
                      controller: waterTaxController,
                      decoration:
                          const InputDecoration(labelText: 'Water Tax'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter water tax' : null,
                    ),
                    TextFormField(
                      controller: propertyTaxController,
                      decoration:
                          const InputDecoration(labelText: 'Property Tax'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter property tax' : null,
                    ),
                    TextFormField(
                      controller: houseNumberController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: 'House Number'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter house number' : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: ElevatedButton(
                        onPressed: handleSubmit,
                        child: const Text('Update'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
