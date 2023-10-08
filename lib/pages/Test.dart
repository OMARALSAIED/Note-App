
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  getdata() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: Column(children: [
        Container(
          child: ElevatedButton(
            child: Text("Get Data"),
            onPressed: () {},
          ),
        )
      ]),
    );
  }
}
