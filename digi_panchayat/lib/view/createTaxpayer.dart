import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://localhost:3001';

class CreateTaxpayerScreen extends StatefulWidget {
  @override
  _CreateTaxpayerScreenState createState() => _CreateTaxpayerScreenState();
}

class _CreateTaxpayerScreenState extends State<CreateTaxpayerScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final houseNumberController = TextEditingController();
  bool? waterTax = false;
  bool? propertyTax = false;

  Future<http.Response> createTaxpayer(
      String name, int houseNumber, bool waterTax, bool propertyTax) async {
    final response = await http.post(
      Uri.parse('$baseUrl/taxpayers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'house_number': houseNumber,
        'water_tax': waterTax,
        'property_tax': propertyTax,
      }),
    );

    if (response.statusCode == 201) {
      return response;
    } else {
      throw Exception('Failed to create taxpayer');
    }
  }

  void handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text;
      int houseNumber = int.parse(houseNumberController.text);
      bool waterTaxValue = waterTax!;
      bool propertyTaxValue = propertyTax!;

      try {
        await createTaxpayer(
            name, houseNumber, waterTaxValue, propertyTaxValue);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Taxpayer created successfully!'),
          ),
        );
        clearForm();
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error creating taxpayer: $error'),
          ),
        );
      }
    }
  }

  void clearForm() {
    nameController.text = '';
    houseNumberController.text = '';
    setState(() {
      waterTax = false;
      propertyTax = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Taxpayer'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(200, 130, 200, 130),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter taxpayer name',
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a name' : null,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: houseNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'House Number',
                        hintText: 'Enter house number',
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter a house number' : null,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Select Tax Types:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListTile(
                      title: Text('Water Tax'),
                      leading: Radio<bool>(
                        value: true,
                        groupValue: waterTax,
                        onChanged: (bool? value) {
                          setState(() {
                            waterTax = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text('Property Tax'),
                      leading: Radio<bool>(
                        value: true,
                        groupValue: propertyTax,
                        onChanged: (bool? value) {
                          setState(() {
                            propertyTax = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: handleSubmit,
                        child: Text('Submit'),
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
