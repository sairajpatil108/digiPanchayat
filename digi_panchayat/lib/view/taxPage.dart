// ignore_for_file: camel_case_types

import 'package:digi_panchayat/view/createTaxpayer.dart';
import 'package:digi_panchayat/view/stasticsTax.dart';
import 'package:digi_panchayat/view/updateTaxpayer.dart';
import 'package:digi_panchayat/view/viewAllTaxpayers.dart';
import 'package:flutter/material.dart';

class taxPage extends StatefulWidget {
  const taxPage({super.key});

  @override
  State<taxPage> createState() => _taxPageState();
}

class _taxPageState extends State<taxPage> {
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
                  width: MediaQuery.of(context).size.width * 0.43,
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
                                              TaxpayerListScreen()));
                                },
                                child: const Text("View Tax Database")),
                            const SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(200, 100)),
                              ),
                              onPressed: () async {
                                String? taxpayerId; // Declare taxpayerId here

                                // Display the dialog to prompt for taxpayerId
                                taxpayerId = await showDialog<String>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Enter Taxpayer ID"),
                                    content: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          hintText: "Enter ID"),
                                      onChanged: (value) => taxpayerId = value,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, taxpayerId),
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  ),
                                );

                                // Navigate to UpdateTaxpayerScreen only if taxpayerId is provided
                                if (taxpayerId != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateTaxpayerScreen(
                                        taxpayerId: int.parse(taxpayerId!),
                                      ),
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CreateTaxpayerScreen()));
                                },
                                child: const Text("Add new Tax payer")),
                            const SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(200, 100)),
                                ),
                                onPressed: () {},
                                child: const Text("view stastics")),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                   Expanded(child: Container()),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: 2,
                  color: Theme.of(context).colorScheme.secondaryContainer,
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
                   TaxpayerStatisticsWidget(),
                 ],
               ),
               Expanded(child: Container()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
