import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple ListView.builder',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple ListView.builder'),
        ),
        body: SimpleListView(),
      ),
    );
  }
}

class SimpleListView extends StatelessWidget {
  final List<String> items = [
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Grapes',
    'Pineapple',
    'Strawberry',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: items.length,scrollDirection: Axis.vertical,padding: EdgeInsetsGeometry.all(30),itemBuilder: (context, index) {
      return ListTile(leading: Icon(Icons.person),trailing: Icon(Icons.arrow_forward),title:  Container(padding: EdgeInsetsGeometry.all(20),color: Colors.pink,margin: EdgeInsetsGeometry.all(10),child: Text(items[index],style: TextStyle(color: Colors.white),)));
    },);
    // return ListView.builder(
    //   itemCount: items.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       leading: CircleAvatar(
    //         child: Text(items[index][0]), // first letter of the item
    //       ),
    //       title: Text(items[index]),
    //     );
    //   },
    // );
  }
}
