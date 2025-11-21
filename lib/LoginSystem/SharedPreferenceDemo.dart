import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'SharedPreferences',
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  late SharedPreferences pref;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    loadPreference();

  }

  loadPreference() async {
    pref = await SharedPreferences.getInstance();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'SharedPreferences Demo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _controllerUsername,
                  decoration: InputDecoration(
                    hintText: "Enter UserName.",
                    border: InputBorder.none,
                    // icon: Icon(Icons.search),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _controllerPassword,
                  decoration: InputDecoration(
                    hintText: "Enter Password.",
                    border: InputBorder.none,
                    // icon: Icon(Icons.search),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  ElevatedButton(
                    onPressed: () {

                      pref.setString('username', _controllerUsername.text.toString());
                      pref.setString('password', _controllerPassword.text.toString());

                      setState(() {
                          _controllerUsername.text = "";
                          _controllerPassword.text = "";
                      });

                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {

                      if(_controllerUsername.text == pref.get('username') && _controllerPassword.text == pref.get('password')){
                        _controllerUsername.text = '';
                        _controllerPassword.text = '';
                        setState(() {

                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful")));

                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login UnSuccessful")));
                      }

                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
