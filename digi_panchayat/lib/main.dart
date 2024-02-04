import 'package:digi_panchayat/data/events.dart';
import 'package:digi_panchayat/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        title: Row(
          children: [
            SizedBox(
              width: 60,
            ),
            Card(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.villa),
            )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    "DigiPanchayat",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(right: 40),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(Icons.person),
                    Text(
                      "Admin",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.green),
                    ),
                  ],
                ),
              )),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          // Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          dashbord(),
        ],
      ),
    );
  }
}

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
                    onPressed: () {},
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
          ],
        ),
      ],
    );
  }
}

class ThemeButton extends StatelessWidget {
  final Function() onPressed;

  const ThemeButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Toggle Theme'),
    );
  }
}
