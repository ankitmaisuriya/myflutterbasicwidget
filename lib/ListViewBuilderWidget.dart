import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      debugShowCheckedModeBanner: false,
      home: const MyListView(),
    );
  }
}

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {

  List<String> list = ['India','Pakistan','Bangladesh','Afghanistan','Srilanka','China','Nepal'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,itemBuilder: (context, index) {

        return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(child: Text(list[index][0])),
              title: Text(list[index] ),
              trailing: Icon(Icons.arrow_forward),
            ));
      },),
    );
  }
}

