import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Text Widget Example')),
        body: const Center(
          child: Text(
            'This is a very long text that might overflow the available space.',
            maxLines: 1,
            softWrap: true,

            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: Colors.blueAccent,
              letterSpacing: 5,
              wordSpacing: 5,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
