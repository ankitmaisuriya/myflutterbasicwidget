import 'package:flutter/material.dart';

/// Flutter code sample for [AppBar].

final List<int> _items = List<int>.generate(51, (int index) => index);

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: const Color(0xff6750a4)),
      home: const AppBarExample(),
    );
  }
}

class AppBarExample extends StatefulWidget {
  const AppBarExample({super.key});

  @override
  State<AppBarExample> createState() => _AppBarExampleState();
}

class _AppBarExampleState extends State<AppBarExample> {
  bool shadowColor = false;
  double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
      ),
      body: Card(
        elevation: 20,
        margin: EdgeInsets.all(30),
        color: Colors.green,
        surfaceTintColor: Colors.red,
        borderOnForeground: false,
        semanticContainer: true,
        shadowColor: Colors.yellow,
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text('John Doe'),
          subtitle: Text('Software Developer'),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            print('Card tapped');
          },
        ),
      )

    );
  }
}
