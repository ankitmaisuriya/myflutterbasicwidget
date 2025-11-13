import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView.builder Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: InfiniteListPage(),
    );
  }
}

class InfiniteListPage extends StatefulWidget {
  @override
  _InfiniteListPageState createState() => _InfiniteListPageState();
}

class _InfiniteListPageState extends State<InfiniteListPage> {
  List<Map<String, String>> items = [];
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMoreItems(); // initial load
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent &&
          !isLoading) {
        _loadMoreItems();
      }
    });
  }

  void _loadMoreItems() async {
    setState(() {
      isLoading = true;
    });

    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    List<Map<String, String>> newItems = List.generate(10, (index) {
      int itemNumber = items.length + index + 1;
      return {
        "title": "Item $itemNumber",
        "image":
        "https://picsum.photos/seed/$itemNumber/200/150" // random image
      };
    });

    setState(() {
      items.addAll(newItems);
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Infinite ListView.builder')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: items.length + 1, // extra item for loading indicator
              itemBuilder: (context, index) {
                if (index == items.length) {
                  return _buildLoadingIndicator();
                }

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: ListTile(
                    leading: Image.network(
                      items[index]['image']!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(items[index]['title']!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Text('No more items'),
      ),
    );
  }
}
