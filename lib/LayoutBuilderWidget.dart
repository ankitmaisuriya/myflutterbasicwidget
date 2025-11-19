import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // constraints.maxWidth -> maximum width available
                // constraints.maxHeight -> maximum height available

                return Container(
                  width: constraints.maxWidth / 2,
                  height: constraints.maxHeight / 2,
                  color: Colors.blue,
                  child: Center(child: Text('Responsive Box')),
                );
              },
      ),
    )
    );
  }
}
