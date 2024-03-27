
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Replace with your actual base URL (e.g., http://localhost:3001)
const baseUrl = '';

class DeleteVillagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Villager Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => _DeleteConfirmationDialog(),
            );
          },
          child: Text("Delete Profile"),
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
        Navigator.of(context).pop(); // Close the dialog
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
      title: Text('Delete Villager Profile'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter the ID of the villager to delete:'),
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
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _deleteProfile,
          child: Text('Delete'),
        ),
      ],
    );
  }
}
