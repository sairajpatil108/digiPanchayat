import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Replace with your actual base URL (e.g., http://localhost:3001)
const baseUrl = 'http://localhost:3001';

class UpdateVillagerScreen extends StatefulWidget {
  final int villagerId;

  const UpdateVillagerScreen({
    required this.villagerId,
  });

  @override
  _UpdateVillagerScreenState createState() => _UpdateVillagerScreenState();
}

class _UpdateVillagerScreenState extends State<UpdateVillagerScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers for form fields
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController(); // Added
  final emailController = TextEditingController(); // Added
  final landHoldingController = TextEditingController();
  final familyIdController = TextEditingController();
  final incomeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchVillagerDetails();
  }

  Future<void> fetchVillagerDetails() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/villagers/${widget.villagerId}'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          nameController.text = data['name'].toString();
          addressController.text = data['address'].toString();
          genderController.text = data['gender'].toString();
          dobController.text = data['dob'].toString();
          phoneController.text = data['phone'].toString(); // Added
          emailController.text = data['email'].toString(); // Added
          landHoldingController.text = data['land_holding'].toString();
          familyIdController.text = data['family_id'].toString();
          incomeController.text = data['income'].toString();
        });
      } else {
        throw Exception('Failed to load villager details');
      }
    } catch (error) {
      print('Error fetching villager details: $error');
      // Handle error
    }
  }

  Future<http.Response> updateVillager(
      String name,
      String address,
      String gender,
      String dob,
      String phone, // Added
      String email, // Added
      double landHolding,
      int familyId,
      double income) async {
    final response = await http.put(
      Uri.parse('$baseUrl/villagers/${widget.villagerId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'address': address,
        'gender': gender,
        'dob': dob,
        'phone': phone, // Added
        'email': email, // Added
        'land_holding': landHolding,
        'family_id': familyId,
        'income': income,
      }),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update villager/villager with ID you have provided might not be present in database');
    }
  }

  void handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text;
      String address = addressController.text;
      String gender = genderController.text;
      String dob = dobController.text;
      String phone = phoneController.text; // Added
      String email = emailController.text; // Added
      double landHolding = double.parse(landHoldingController.text);
      int familyId = int.parse(familyIdController.text);
      double income = double.parse(incomeController.text);

      try {
        await updateVillager(
            name, address, gender, dob, phone, email, landHolding, familyId, income);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Villager updated successfully!'),
          ),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating villager: $error'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Villager'),
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
                      controller: phoneController, // Added
                      decoration: const InputDecoration(labelText: 'Phone'), // Added
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter phone number' : null, // Added
                    ),
                    TextFormField(
                      controller: emailController, // Added
                      decoration: const InputDecoration(labelText: 'Email'), // Added
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter email' : null, // Added
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



