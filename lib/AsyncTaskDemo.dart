import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AsyncExample(),
    );
  }
}

class AsyncExample extends StatefulWidget {
  @override
  _AsyncExampleState createState() => _AsyncExampleState();
}

class _AsyncExampleState extends State<AsyncExample> {
  String message = "Waiting...";

  // Simple async task
  // Future<void> loadMessage() async {
  //   await Future.delayed(Duration(seconds: 2)); // Simulate background work
  //   setState(() {
  //     message = "Task Completed!";
  //   });
  // }

  loadMessage() async {
   await Future.delayed(Duration(seconds: 5),() {
      setState(() {
        message = "Task Completed!";
      });
    },);
   print("Load message");
  }

  // @override
  void initState() {
    super.initState();
    loadMessage(); // Call async task
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Async Task Example")),
      body: Center(
        child: Text(
          message,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
