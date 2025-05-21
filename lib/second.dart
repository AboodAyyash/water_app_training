import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  String password;
  SecondPage({super.key, required this.password});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.password), backgroundColor: Colors.red),
      body: Column(children: []),
    );
  }
}
