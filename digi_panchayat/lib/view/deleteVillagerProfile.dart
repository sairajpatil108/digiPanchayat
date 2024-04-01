
// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


const baseUrl = '';

class DeleteVillagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Villager Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => _DeleteConfirmationDialog(),
            );
          },
          child: const Text("Delete Profile"),
        ),
      ),
    );
  }
}

class _DeleteConfirmationDialog extends StatefulWidget {
  @override
  __DeleteConfirmationDialogState createState() =>
      __DeleteConfirmationDialogState();
}

class __DeleteConfirmationDialogState extends State<_DeleteConfirmationDialog> {
  final TextEditingController idController = TextEditingController();

  void _deleteProfile() async {
    final id = idController.text;
    // Perform delete operation here with the provided ID
    try {
      final response =
          await http.delete(Uri.parse('$baseUrl/villagers/$id'));

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Villager with ID $id deleted successfully!'),
          ),
        );
        Navigator.of(context).pop(); 
      } else {
        throw Exception('Failed to delete villager');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error deleting villager: $error'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Villager Profile'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Enter the ID of the villager to delete:'),
          TextFormField(
            controller: idController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter ID';
              }
              return null;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _deleteProfile,
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
