import 'package:flutter/material.dart';

void main() {
  runApp(const NullSafetyDemoApp());
}

class NullSafetyDemoApp extends StatelessWidget {
  const NullSafetyDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Null Safety Demo',
      debugShowCheckedModeBanner: false,
      home: NullSafetyHome(),
    );
  }
}

class NullSafetyHome extends StatefulWidget {
  @override
  State<NullSafetyHome> createState() => _NullSafetyHomeState();
}

class _NullSafetyHomeState extends State<NullSafetyHome> {
  // Nullable variable
  String? userName;

  // Late variable (must be initialized before use)
  late String appTitle;

  @override
  void initState() {
    super.initState();
    appTitle = "Null Safety Demo App"; // initializing late variable
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Your Name (Can be null)",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Type your name...",
              ),
              onChanged: (value) {
                setState(() {
                  userName = value.isEmpty ? null : value;
                });
              },
            ),

            const SizedBox(height: 20),

            const Text(
              "Output:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Null-safe UI
            Text(
              userName ?? "No name entered yet",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            // Null-safe conditional access
            Text(
              "Name length: ${userName?.length ?? 0}",
              style: const TextStyle(fontSize: 18),
            ),

            const Spacer(),

            // Button that safely uses null check
            ElevatedButton(
              onPressed: () {
                if (userName != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Hello, ${userName!}!")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Name is null")),
                  );
                }
              },
              child: const Text("Greet Safely !!!"),
            ),
          ],
        ),
      ),
    );
  }
}
