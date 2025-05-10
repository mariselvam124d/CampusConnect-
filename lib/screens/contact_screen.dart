import 'package:flutter/material.dart';

void main() {
  runApp(contactscreen());
}

class contactscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome App'),
        ),
        body: Center(
          child: Text(
            'Welcome to Flutter!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
