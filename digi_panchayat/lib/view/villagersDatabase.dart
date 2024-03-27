// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:digi_panchayat/data/statisticsOverviewVillagers.dart';
import 'package:digi_panchayat/view/createVillagerPage.dart';
import 'package:digi_panchayat/view/updateVillagerProfile.dart';
import 'package:digi_panchayat/view/viewAllProfiles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class villagersDatabasePage extends StatefulWidget {
  const villagersDatabasePage({super.key});

  @override
  State<villagersDatabasePage> createState() => _villagersDatabasePageState();
}

class _villagersDatabasePageState extends State<villagersDatabasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        title: Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            const Card(
                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.villa),
            )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "DigiPanchayat",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            //   dashbord(),
            Row(
              children: <Widget>[
                Expanded(child: Container()),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: Theme.of(context).colorScheme.background,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(200, 100)),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CreateVillagerScreen()));
                                },
                                child: const Text("create villager profile")),
                            const SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(200, 100)),
                              ),
                              onPressed: () async {
                                String? villagerId; // Declare villagerId here

                                // Display the dialog to prompt for villagerId
                                villagerId = await showDialog<String>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Enter Villager ID"),
                                    content: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          hintText: "Enter ID"),
                                      onChanged: (value) => villagerId = value,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, villagerId),
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  ),
                                );

                                // Navigate to UpdateVillagerScreen only if villagerId is provided
                                if (villagerId != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateVillagerScreen(
                                              villagerId:
                                                  int.parse(villagerId!)),
                                    ),
                                  );
                                }
                              },
                              child: const Text("Update existing profile"),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(200, 100)),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        _DeleteConfirmationDialog(),
                                  );
                                },
                                child: const Text("delete profile")),
                            const SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(200, 100)),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VillagerListScreen()));
                                },
                                child: const Text("view Database")),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0).copyWith(right: 40),
                        child: const Row(
                          children: [
                            Icon(Icons.analytics),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Stastics"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height * 0.6,
                      color: Theme.of(context).colorScheme.background,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ListView.builder(
                                itemCount: statisticsDataVillagers.length,
                                itemBuilder: (context, index) {
                                  final statistics =
                                      statisticsDataVillagers[index];
                                  return Card(
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    child: ListTile(
                                      title: Text(statistics.attribute),
                                      subtitle: Text(statistics.data),
                                      // You can add more ListTile customization here
                                    ),
                                  );
                                },
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
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
          await http.delete(Uri.parse('http://localhost:3001/villagers/$id'));

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
