import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(title: 'GridView Demo',debugShowCheckedModeBanner: false,home: GridExample(),));
}

class GridExample extends StatelessWidget {
  const GridExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView Example")),
      
      body: GridView.count(
        crossAxisCount: 3, // number of columns
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: List.generate(6, (index) {
          return Container(
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                "Item $index",
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          );
        }),
      ),
    );
  }
}
