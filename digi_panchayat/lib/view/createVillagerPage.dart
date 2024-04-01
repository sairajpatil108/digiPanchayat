import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


const baseUrl = 'http://localhost:3001';

class CreateVillagerScreen extends StatefulWidget {
  @override
  _CreateVillagerScreenState createState() => _CreateVillagerScreenState();
}

class _CreateVillagerScreenState extends State<CreateVillagerScreen> {
  final _formKey = GlobalKey<FormState>();

 
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController(); // Added phone controller
  final emailController = TextEditingController(); // Added email controller
  final landHoldingController = TextEditingController();
  final familyIdController = TextEditingController();
  final incomeController = TextEditingController();

  Future<http.Response> createVillager(
      String name,
      String address,
      String gender,
      String dob,
      String phone,
      String email,
      double landHolding,
      int familyId,
      double income) async {
    final response = await http.post(
      Uri.parse('$baseUrl/villagers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'address': address,
        'gender': gender,
        'dob': dob,
        'phone': phone, 
        'email': email, 
        'land_holding': landHolding,
        'family_id': familyId,
        'income': income,
      }),
    );

    if (response.statusCode == 201) {
      return response;
    } else {
      throw Exception('Failed to create villager');
    }
  }

  void clearForm() {
    nameController.text = '';
    addressController.text = '';
    genderController.text = '';
    dobController.text = '';
    phoneController.text = '';
    emailController.text = '';
    landHoldingController.text = '';
    familyIdController.text = '';
    incomeController.text = '';
  }

  void handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text;
      String address = addressController.text;
      String gender = genderController.text;
      String dob = dobController.text;
      String phone = phoneController.text; 
      String email = emailController.text; 
      double landHolding = double.parse(landHoldingController.text);
      int familyId = int.parse(familyIdController.text);
      double income = double.parse(incomeController.text);

      try {
        await createVillager(
            name, address, gender, dob, phone, email, landHolding, familyId, income);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Villager created successfully!'),
          ),
        );
        clearForm();
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error creating villager: $error'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Villager'),
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
                      controller: addressController,
                      decoration: const InputDecoration(labelText: 'Address'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter an address' : null,
                    ),
                    TextFormField(
                      controller: genderController,
                      decoration: const InputDecoration(labelText: 'Gender'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter gender' : null,
                    ),
                    TextFormField(
                      controller: dobController,
                      decoration: const InputDecoration(
                          labelText: 'Date of Birth (DD-MM-YYYY)'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter date of birth' : null,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(labelText: 'Phone'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter phone number' : null,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter an email' : null,
                    ),
                    TextFormField(
                      controller: landHoldingController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Land Holding (in hectares)'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter land holding';
                        } else {
                          try {
                            double.parse(value);
                            return null;
                          } catch (e) {
                            return 'Invalid land holding value';
                          }
                        }
                      },
                    ),
                    TextFormField(
                      controller: familyIdController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Family ID'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter family ID';
                        } else {
                          try {
                            int.parse(value);
                            return null;
                          } catch (e) {
                            return 'Invalid family ID';
                          }
                        }
                      },
                    ),
                    TextFormField(
                      controller: incomeController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Income'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter income';
                        } else {
                          try {
                            double.parse(value);
                            return null;
                          } catch (e) {
                            return 'Invalid income value';
                          }
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: ElevatedButton(
                        onPressed: handleSubmit,
                        child: const Text('Create Villager'),
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
