import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         body: SafeArea(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(9, (index) {
                return Container(
                  margin: EdgeInsets.all(4),
                  color: Colors.blue,
                  child: Center(child: Text("Item $index")),
                );
              }),
            ),
          )

        // body: SafeArea(
        //
        //   bottom: false,
        //   child: Center(
        //     child: Text(
        //       'Hello SafeArea!',
        //       style: TextStyle(fontSize: 24),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
