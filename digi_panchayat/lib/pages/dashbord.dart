import 'package:digi_panchayat/data/events.dart';
import 'package:digi_panchayat/pages/taxPage.dart';
import 'package:flutter/material.dart';

class dashbord extends StatefulWidget {
  const dashbord({super.key});

  @override
  State<dashbord> createState() => _dashbordState();
}

class _dashbordState extends State<dashbord> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height * 0.8,
          color: Theme.of(context).colorScheme.background,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(400, 100)),
                    ),
                    onPressed: () {},
                    child: Text("Villager's Database")),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(400, 100)),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => taxPage()));
                    },
                    child: Text("Tax"))
              ],
            ),
          ),
        ),
        Column(
          children: [
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.all(10.0).copyWith(left: 40, right: 40),
                child: Text("Events"),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height * 0.6,
              color: Theme.of(context).colorScheme.background,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ListView.builder(
                      itemCount: eventData.length,
                      itemBuilder: (context, index) {
                        final event = eventData[index];
                        return InkWell(
                          onTap: () {},
                          child: Card(
                            color: Theme.of(context).colorScheme.surface,
                            child: ListTile(
                              title: Text(event.eventName),
                              subtitle: Text(event.dateTime),
                              // You can add more ListTile customization here
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  _showBottomSheet(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "update",
                    style: TextStyle(fontSize: 16),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Icon(
                  Icons.add_task_rounded,
                  size: 50,
                  color: Color.fromARGB(255, 52, 255, 157),
                ),
                height: 60,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 8, 50, 8),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Task"),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 8, 50, 8),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Discription"),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the bottom sheet
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    ),
  );
}
