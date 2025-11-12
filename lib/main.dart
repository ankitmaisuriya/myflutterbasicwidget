import 'package:flutter/material.dart';

/// Flutter code sample for [AppBar].

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey('Scaffold'),
      backgroundColor: Color(0xAC2A2A2A),
      appBar: AppBar(
        title: Text(
          'AppBar Demo',
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        leading: Text('Click Me!'),
        key: ValueKey('AppBar'),
        centerTitle: true,
        //surfaceTintColor: Colors.orange,
        bottomOpacity: 10,
        actions: [
          IconButton(
            tooltip: 'Show Notification!',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Thank you for clicking me!')),
              );
            },
            icon: Icon(Icons.add_alert),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome to App Bar Demo!",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
