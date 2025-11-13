import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'GridView Demo',
      debugShowCheckedModeBanner: false,
      home: GridExample(),
    ),
  );
}

class GridExample extends StatelessWidget {
  const GridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView Example")),

      body: GridView.builder(
        itemCount: 15,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return Container(
            alignment: AlignmentGeometry.center,
            color: Colors.blue,
            height: 200,
            width: 200,
            child: Text('Hello', style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
