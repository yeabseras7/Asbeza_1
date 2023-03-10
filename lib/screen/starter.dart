import 'package:flutter/material.dart';
import 'home.dart';

class St extends StatefulWidget {
  const St({super.key});

  @override
  State<St> createState() => _StState();
}

class _StState extends State<St> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              child: Text("Enter"))),
    );
  }
}
