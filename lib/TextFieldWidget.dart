import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('TextField Example')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Username',
              hintText: 'Enter your username',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
        ),
      ),
    );
  }
}
