import 'package:flutter/material.dart';

void main() {
  runApp(MyScaffoldApp());
}

class MyScaffoldApp extends StatelessWidget {
  const MyScaffoldApp({super.key});

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return MaterialApp(
      title: 'Scaffold Demo',
      debugShowCheckedModeBanner: false,
      key: ValueKey('MaterialApp'),
      home: Scaffold(
        key: ValueKey('Scaffold1'),
        body: Text('Count value : $count.', textAlign: TextAlign.center),
        appBar: AppBar(key: ValueKey('AppBar'), title: Text('Scaffold Widget')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            count++;
            print(count);
            // setState(() {}); You can not use setState becuase its StatelessWidget
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
