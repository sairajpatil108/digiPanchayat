// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class adminButton extends StatefulWidget {
  const adminButton({super.key});

  @override
  State<adminButton> createState() => _adminButtonState();
}

class _adminButtonState extends State<adminButton> {
  bool logIn = true;

  void toggleLoginState() {
    setState(() {
      logIn = !logIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).copyWith(right: 40),
      child: InkWell(
          onTap: () {},
          child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // Return the AlertDialog
                    return AlertDialog(
                      title: logIn ? null : const Text('Login '),
                      content: logIn
                          ? ElevatedButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(100, 60)),
                              ),
                              onPressed: () {
                                setState(() {
                                  logIn = !logIn;
                                });
                                Navigator.of(context).pop();
                              },
                              child: const Text("logout"))
                          : SizedBox(
                              height: 200,
                              child: Column(
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Enter your username',
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Enter your username',
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        logIn = !logIn;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: logIn
                                        ? const Text('Log Out')
                                        : const Text('Log In'),
                                  ),
                                ],
                              ),
                            ),
                      // actions: [],
                    );
                  },
                );
              },
              child: logIn ? const loginCard() : const logoutCard())),
    );
  }
}

class logoutCard extends StatefulWidget {
  const logoutCard({super.key});

  @override
  State<logoutCard> createState() => _logoutCardState();
}

class _logoutCardState extends State<logoutCard> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(Icons.login_rounded),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(Icons.circle, size: 10, color: Colors.red),
                ),
                Text(
                  "Login",
                  style:
                      TextStyle(fontWeight: FontWeight.w400, color: Colors.red),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class loginCard extends StatefulWidget {
  const loginCard({super.key});

  @override
  State<loginCard> createState() => _loginCardState();
}

class _loginCardState extends State<loginCard> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(Icons.person),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(Icons.circle, size: 10, color: Colors.green),
                ),
                Text(
                  "Admin",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.green),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
