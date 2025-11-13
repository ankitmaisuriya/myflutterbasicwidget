import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elevated Button',
      debugShowCheckedModeBanner: false,
      home: const MyElevatedButtonWidget(),
    );
  }
}

class MyElevatedButtonWidget extends StatefulWidget {
  const MyElevatedButtonWidget({super.key});

  @override
  State<MyElevatedButtonWidget> createState() => _MyElevatedButtonWidgetState();
}

class _MyElevatedButtonWidgetState extends State<MyElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onHover: (value) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Mouse Hover!!!")));
          },
          onPressed: null,
          // onPressed: () {
          //   ScaffoldMessenger.of(
          //     context,
          //   ).showSnackBar(SnackBar(content: Text("Thanks for Clicking me")));
          // },
          child: Text('Click Me!'),
        ),
      ),
    );
  }
}
