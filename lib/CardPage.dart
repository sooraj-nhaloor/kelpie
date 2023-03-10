// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kelpie/Support.dart';

import 'package:kelpie/main.dart';

import 'loginPage.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Image.asset(
                  "assets/icon.png",
                  width: 50,
                  height: 50,
                ),
                const Text(
                  "Kelpie",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ]),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Support"),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Support()));
                /////
              },
            )
          ])),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: GridView.count(
                  padding: const EdgeInsets.all(20),
                  crossAxisCount: 2,
                  children: [
                    Card(
                      elevation: 20,
                      child: InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const MyHomePage())),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/motor_ico.png",
                                height: 100,
                                width: 100,
                              ),
                              const Text(
                                "Motor Controls",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Segoe"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 20,
                      child: InkWell(
                        onTap: () => ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("New features will be added soon!"),
                        )),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/comingsoon_ico.png",
                                height: 100,
                                width: 100,
                              ),
                              const Text(
                                "Coming Soon",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Segoe"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 20,
                      child: InkWell(
                        onTap: () => ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("New features will be added soon!"),
                        )),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/comingsoon_ico.png",
                                height: 100,
                                width: 100,
                              ),
                              const Text(
                                "Coming Soon",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Segoe"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    readRef.onValue.listen((DatabaseEvent databaseEvent) {
                      var statusLed = databaseEvent.snapshot.value;
                      if (statusLed == 0) {
                        signout();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const loginPage()));
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("WARNING !"),
                                content: const Text(
                                    "Please Turn OFF Motor,\n\nIf problem still exist, there maybe trouble connecting with your device."),
                                actions: [
                                  TextButton(
                                      child: const Text(""),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      })
                                ],
                              );
                            });
                      }
                    });

                    // ignore: use_build_context_synchronously
                  },
                  child: const Text("LogOut"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

signout() async {
  await FirebaseAuth.instance.signOut();
}
