import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      debugShowCheckedModeBanner: false,
      home: const MyToDoList(),
    );
  }
}

class MyToDoList extends StatefulWidget {
  const MyToDoList({super.key});

  @override
  State<MyToDoList> createState() => _MyToDoListState();
}

class _MyToDoListState extends State<MyToDoList> {
  final TextEditingController _controller = TextEditingController();
  List<String> items = [];
  var value = true;

  @override
  void dispose() {

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ToDo List',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black12,
        actions: [
          Tooltip(
            message: 'Clear all',
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(child: Icon(Icons.clear_all)),
              ),
              onTap: () {
                items.clear();
                _controller.text = '';
                setState(() {});
              },
            ),
          ),
          Tooltip(
            message: 'A - Z / Z - A',
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: Icon(
                    value
                        ? Icons.arrow_downward_outlined
                        : Icons.arrow_upward_outlined,
                  ),
                ),
              ),
              onTap: () {
                items.sort((a, b) {
                  if (value) {
                    return b.compareTo(a);
                  } else {
                    return a.compareTo(b);
                  }
                });
                value = !value;

                setState(() {});
              },
            ),
          ),
          //   Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CircleAvatar(child:Icon(Icons.arrow_upward_outlined),),
          // )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsetsGeometry.all(20),
            child: Row(
              textDirection: TextDirection.ltr,
              spacing: 10,
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      label: Text('Please enter the text here!'),
                      hint: Text('Type here!'),
                      border: OutlineInputBorder(),
                    ),

                    onSubmitted: (value) {
                      items.add(value);
                      items.sort((a, b) {
                        if (this.value) {
                          return a.compareTo(b);
                        } else {
                          return b.compareTo(a);
                        }
                      });
                      _controller.text = '';
                      setState(() {});
                    },
                  ),
                ),
                Tooltip(
                  message: 'Add',
                  child: ElevatedButton(
                    onPressed: () {
                      items.add(_controller.text);
                      setState(() {});
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //       "You should Type something in TextField!",
                      //     ),
                      //   ),
                      // );
                    },
                    child: Text('Add'),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   padding: EdgeInsetsGeometry.all(10),
          //   child:
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: 50,
                  color: Colors.blue,alignment: AlignmentGeometry.center,
                  child: Text(items[index],style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
                );
              },
            ),
            // child: GridView.builder(
            //   itemCount: items.length,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       alignment: AlignmentGeometry.center,
            //       height: 100,
            //       margin: EdgeInsetsGeometry.all(10),
            //       decoration: BoxDecoration(
            //         border: Border.all(color: Colors.deepOrange, width: 3),
            //         color: Colors.orange,
            //       ),
            //       child: ListTile(
            //         leading: CircleAvatar(
            //           child: Text(
            //             items[index][0],
            //             style: TextStyle(color: Colors.white),
            //           ),
            //         ),
            //         title: Text(
            //           items[index],
            //           style: TextStyle(color: Colors.white),
            //         ),
            //         trailing: Icon(Icons.arrow_forward),
            //       ),
            //     );
            //   },
            // ),
          ),
          // ),
        ],
      ),
    );
  }
}
