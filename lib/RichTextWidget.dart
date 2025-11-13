import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('RichText Example')),
        body: Center(
          child: RichText(
            text: TextSpan(
              text: 'My Name ',
              style: TextStyle(fontSize: 20, color: Colors.black),
              children: [
                TextSpan(
                  text: 'is',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: ' Ankit',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            // text: TextSpan(
            //   text: 'Hello ',
            //   style: TextStyle(fontSize: 20, color: Colors.black),
            //   children: [
            //     TextSpan(
            //       text: 'Rich ',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         color: Colors.blue,
            //       ),
            //     ),
            //     TextSpan(
            //       text: 'Text!',
            //       style: TextStyle(
            //         fontStyle: FontStyle.italic,
            //         color: Colors.green,
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
