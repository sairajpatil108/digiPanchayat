// Import necessary libraries
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Define the base URL
const baseUrl = 'http://localhost:3001';

// Create a stateful widget for the CreateVillagerScreen
class CreateVillagerScreen extends StatefulWidget {
  @override
  _CreateVillagerScreenState createState() => _CreateVillagerScreenState();
}

class _CreateVillagerScreenState extends State<CreateVillagerScreen> {
  // Define a global key for the form
  final _formKey = GlobalKey<FormState>();

  // Initialize text controllers for various fields
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  String? gender;
  final dobController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final landHoldingController = TextEditingController();
  final familyIdController = TextEditingController();
  final incomeController = TextEditingController();

  // Function to make a POST request to create a villager
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

  // Function to clear the form fields
  void clearForm() {
    nameController.text = '';
    addressController.text = '';
    gender = null;
    dobController.text = '';
    phoneController.text = '';
    emailController.text = '';
    landHoldingController.text = '';
    familyIdController.text = '';
    incomeController.text = '';
  }

  // Function to validate the email format
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    } else if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }
  // Function to handle form submission
  void handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text;
      String address = addressController.text;
      String dob = dobController.text;
      String phone = phoneController.text;
      String email = emailController.text;
      double landHolding = double.parse(landHoldingController.text);
      int familyId = int.parse(familyIdController.text);
      double income = double.parse(incomeController.text);

      try {
        await createVillager(
            name, address, gender!, dob, phone, email, landHolding, familyId, income);
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
                    Row(
                      children: [
                        Radio<String>(
                          value: 'M',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                        ),
                        const Text('Male'),
                        Radio<String>(
                          value: 'F',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                        ),
                        const Text('Female'),
                      ],
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
                      validator: validatePhoneNumber,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: validateEmail, // Using validateEmail function
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
