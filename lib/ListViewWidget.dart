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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: ListView(
        padding: EdgeInsetsGeometry.all(20),
        reverse: true,
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,

        children: [
          Text("India",style: TextStyle(fontSize: 100),),
          Text("Pakistan",style: TextStyle(fontSize: 100),),
          Text("Afghnistan",style: TextStyle(fontSize: 100),),
          Text("SriLanka",style: TextStyle(fontSize: 100),),
          Text("Nepal",style: TextStyle(fontSize: 100),),
          Text("China",style: TextStyle(fontSize: 100),),
          Text("HongKong",style: TextStyle(fontSize: 100),),
          Text("Bangladesh",style: TextStyle(fontSize: 100),),
        ],
      ),
    );
  }
}

